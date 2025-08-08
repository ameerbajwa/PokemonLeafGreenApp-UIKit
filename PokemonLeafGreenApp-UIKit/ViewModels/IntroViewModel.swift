//
//  IntroViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/12/25.
//

import Foundation
import UIKit

class IntroViewModel: NSObject {
    var pokeAPINetworkService: PokeAPINetworkService
    var coreDataNetworkService: CoreDataNetworkService
    var introView: IntroView
    var controllerViewFrameSize: CGSize?
    
    var introMessageCounter = 0
    var newJourneyMessageCounter = 0
    var playerName = ""
    var playerSelectedPokemon = ""
    var starterPokemonNameList: [String] = [PokemonIdNameConfiguration.bulbasaur.name,
                                            PokemonIdNameConfiguration.charmander.name,
                                            PokemonIdNameConfiguration.squirtle.name]
    
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, introView: IntroView) {
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
                        await self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage2(playerName: playerName))
                        newJourneyMessageCounter += 1
                    }
                } else if newJourneyMessageCounter == 7 {
                    if playerSelectedPokemon.isEmpty {
                        print("Starter Pokemon not selected yet. Please select starter pokemon")
                        return
                    } else {
                        self.introView.removeStarterPokmeonButons()
                        self.introView.introTextView.cancelButton.isEnabled = false
                        await self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage7(selectedPokemon: playerSelectedPokemon))
                        newJourneyMessageCounter += 1
                    }
                } else if newJourneyMessageCounter == 10 {
                    await self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage10(playerName: playerName))
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
                    await self.introView.introTextView.animateMessage(message: NewJourneyMessages.newJourneyLines[newJourneyMessageCounter])
                    newJourneyMessageCounter += 1
                }
            }
        }
    }
    
    @MainActor
    func dismissPokemonSelection() {
        self.introView.introTextView.messageLabel.text = NewJourneyMessages.newQuestMessage6
    }
    
    func displayPokemonSelectedMessage(message: String, selectedPokemon: String) {
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

// MARK: - Networking calls to grab starter pokemon information

extension IntroViewModel {
    func checkCoreDataPokemonObject() async {
        for (index, starterPokemon) in starterPokemonNameList.enumerated() {
            do {
                let coreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierValue: starterPokemon)
                _ = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
                starterPokemonNameList.remove(at: index)
            } catch let error as PokemonLeafGreenError {
                print(error.errorLogDescription)
                print(error.clientDescription)
            } catch {
                print("Shit went wrong - \(error.localizedDescription)")
            }
        }
        
//        if starterPokemonNameList.count > 0 {
//            storePokemonInCoreData()
//        }
    }
    
//    func storePokemonInCoreData() {
//        for pokemon in starterPokemonNameList {
//            let pokemonRequest = PokeAPIRequest<PokeAPIPokemonDetails>(endpoint: .pokemon, id: 1)
//            let pokemonSpeciesRequest = PokeAPIRequest<PokeAPIPokemonSpeciesDetails>(endpoint: .species, id: 1)
//            
//            Task {
//                do {
//                    let pokemonResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonRequest)
//                    let pokemonSpeciesResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonSpeciesRequest)
//                    try await coreDataNetworkService.saveCoreDataPokemonModel(pokeAPIPokemon: pokemonResponse, pokeAPIPokemonSpecies: pokemonSpeciesResponse)
//                } catch let error as PokemonLeafGreenError {
//                    print(error.errorLogDescription)
//                    print(error.clientDescription)
//                }
//            }
//        }
//    }
}
