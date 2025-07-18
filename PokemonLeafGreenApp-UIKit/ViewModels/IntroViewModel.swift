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
    
    var introMessageCounter = 0
    var newJourneyMessageCounter = 0
    var playerName = ""
    var starterPokemon = ""
    
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, introView: IntroView) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.introView = introView
        super.init()
        
        self.introView.viewModel = self
        self.introView.introTextView.viewModel = self
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
    func displayNextMessage() {
        if introMessageCounter < IntroMessages.introLines.count {
            self.introView.introTextView.animateMessage(message: IntroMessages.introLines[introMessageCounter])
            introMessageCounter += 1
        }
        
        if introMessageCounter == IntroMessages.introLines.count {
            if newJourneyMessageCounter < NewJourneyMessages.newJourneyLines.count {
                if newJourneyMessageCounter == 2 {
                    if playerName.isEmpty {
                        return
                    } else {
                        self.introView.removePlayerNameTextFieldFromView()
                        self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage2(playerName: playerName))
                        newJourneyMessageCounter += 1
                    }
                } else if newJourneyMessageCounter == 7 {
                    self.introView.removeStarterPokmeonButons()
                    self.introView.introTextView.cancelButton.isHidden = true
                    self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage7(selectedPokemon: starterPokemon))
                    newJourneyMessageCounter += 1
                } else if newJourneyMessageCounter == 10 {
                    self.introView.introTextView.animateMessage(message: NewJourneyMessages.newQuestMessage10(playerName: playerName))
                    newJourneyMessageCounter += 1
                } else {
                    if newJourneyMessageCounter == 1 {
                        self.introView.setupPlayerNameTextField()
                    }
                    if newJourneyMessageCounter == 6 {
                        self.introView.setupStarterPokemonButtons()
                        self.introView.setUpImagesForStarterPokemonButtons()
                        self.introView.introTextView.cancelButton.isHidden = false
                    }
                    self.introView.introTextView.animateMessage(message: NewJourneyMessages.newJourneyLines[newJourneyMessageCounter])
                    newJourneyMessageCounter += 1
                }
            }
        }
    }
    
    func dismissPokemonSelection() {
        self.introView.introTextView.messageLabel.text = NewJourneyMessages.newQuestMessage6
    }
    
    func displayPokemonSelectedMessage(message: String, selectedPokemon: String) {
        self.starterPokemon = selectedPokemon
        self.introView.introTextView.animateMessage(message: message)
    }
}

extension IntroViewModel: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        playerName = textField.text ?? ""
    }
}
