//
//  IntroViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/12/25.
//

import Foundation
import UIKit

class IntroViewModel: NSObject {
    var pokemonLocationConfiguration: PokemonLocationConfiguration
    var pokeAPINetworkService: PokeAPINetworkService
    var coreDataNetworkService: CoreDataNetworkService
    var introView: IntroView
    var controllerViewFrameSize: CGSize?
    
    var introMessageCounter = 0
    var newJourneyMessageCounter = 0
    var playerName = ""
    var playerSelectedPokemon: PokemonIdNameConfiguration?
    var starterPokemonNameList: [PokemonIdNameConfiguration] = [PokemonIdNameConfiguration.bulbasaur,
         PokemonIdNameConfiguration.charmander,
         PokemonIdNameConfiguration.squirtle]
    
    init(configuration: PokemonLocationConfiguration, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, introView: IntroView) {
        self.pokemonLocationConfiguration = configuration
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.introView = introView
        super.init()
    }
    
    func generatePokemonImage(id: Int) async -> UIImage? {
        let pokemonImageRequest = PokeAPIImageRequest(endpoint: .frontImage, id: id)
        
        do {
            let pokemonImageData = try await pokeAPINetworkService.retrievePokeAPIImageData(with: pokemonImageRequest)
            
            return UIImage(data: pokemonImageData)
        } catch {
            return nil
        }
    }
}

extension IntroViewModel {
    @MainActor
    func displayNextMessage() {
        Task {
            if introMessageCounter < IntroMessages.introLines.count {
                await self.introView.introTextView.animateMessage(message: IntroMessages.introLines[introMessageCounter])
                introMessageCounter += 1
            } else if newJourneyMessageCounter < NewJourneyMessages.newJourneyLines.count {
                if newJourneyMessageCounter == 2 {
                    if playerName.isEmpty {
                        print("playerName is not being recorded from the textfield")
                        return
                    } else {
                        self.introView.removePlayerNameTextFieldFromView()
                        await savePlayerName()
                        await self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage2(playerName: playerName))
                        newJourneyMessageCounter += 1
                    }
                } else if newJourneyMessageCounter == 7 {
                    guard let selectedPokemon = playerSelectedPokemon else {
                        print("Starter Pokemon not selected yet. Please select starter pokemon")
                        return
                    }
                    self.introView.removeStarterPokemonButons()
                    self.introView.setupSelectedPokemonImage(pokemon: selectedPokemon)
                    self.introView.introTextView.cancelButton.isEnabled = false
//                    self.pokemonLocationConfiguration
                    await savePlayerStarterPokemon(selectedPokemon: selectedPokemon)
                    await self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage7(selectedPokemon: selectedPokemon.name))
                    newJourneyMessageCounter += 1
                } else if newJourneyMessageCounter == 11 {
                    await self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage11(playerName: playerName))
                    newJourneyMessageCounter += 1
                } else {
                    if newJourneyMessageCounter == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            self.introView.playerNameTextField.isHidden = false
                            self.introView.playerNameTextField.becomeFirstResponder()
                        }
                    }
                    if newJourneyMessageCounter == 6 {
                        self.introView.setupStarterPokemonButtons()
                        self.introView.setUpImagesForStarterPokemonButtons()
                        self.introView.introTextView.cancelButton.isEnabled = true
                    }
                    if newJourneyMessageCounter == 8 {
                        self.introView.removeSelectedPokemonImage()
                    }
                    await self.introView.introTextView.animateMessage(message: NewJourneyMessages.newJourneyLines[newJourneyMessageCounter])
                    newJourneyMessageCounter += 1
                }
            }
        }
    }
    
    @MainActor
    func dismissPokemonSelection() {
        self.playerSelectedPokemon = nil
        self.introView.introTextView.messageLabel.text = NewJourneyMessages.newQuestMessage6
    }
    
    func displayPokemonSelectedMessage(message: String, selectedPokemon: PokemonIdNameConfiguration) {
        self.playerSelectedPokemon = selectedPokemon
        Task {
            await self.introView.introTextView.animateMessage(message: message)
        }
    }
}

extension IntroViewModel: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        playerName = textField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        playerName = textField.text ?? ""
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Saving Player information

extension IntroViewModel {
    func savePlayerName() async {
        do {
            try await coreDataNetworkService.saveGamePlayerModel(playerName: playerName)
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
        } catch {
            print("Shit went wrong - \(error.localizedDescription)")
        }
    }
    
    func savePlayerStarterPokemon(selectedPokemon: PokemonIdNameConfiguration) async {
        do {
            try await coreDataNetworkService.saveGamePlayerModel(starterPokemon: selectedPokemon)
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
        } catch {
            print("Shit went wrong - \(error.localizedDescription)")
        }
    }
}
