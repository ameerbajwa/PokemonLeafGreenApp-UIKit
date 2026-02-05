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
    var pokemonStorageService: PokemonNetworkCheckingAndStoring
    weak var delegate: IntroManaging?
    
    var introMessageCounter = 0
    var newJourneyMessageCounter = 0
    var playerName: String?
    var playerSelectedPokemon: PokemonIdNameConfiguration?
    
    init(locationConfiguration: PokemonLocationConfiguration, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, pokemonStorageService: PokemonNetworkCheckingAndStoring) {
        print("IntroViewModel created and stored in memory")
        self.pokemonLocationConfiguration = locationConfiguration
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.pokemonStorageService = pokemonStorageService
        self.pokemonStorageService.pokemonLocationConfiguration = locationConfiguration
    }
    
    deinit {
        print("IntroViewModel removed from memory")
    }
    
    func checkAndStorePokemonInfoFromPokemonLocationConfiguration() async throws {
        try await pokemonStorageService.checkAndStorePokemonInfo()
    }
    
    func generatePokemonImage(id: Int) async -> Data? {
        let pokemonImageRequest = PokeAPIImageRequest(endpoint: .frontImage, id: id)
        
        do {
            return try await pokeAPINetworkService.retrievePokeAPIImageData(with: pokemonImageRequest)
        } catch {
            return nil
        }
    }
    
    func retreiveStarterPokemonImageData() async -> (Data?, Data?, Data?) {
        async let bulbasaurImage = generatePokemonImage(id: 1)
        async let charmanderImage = generatePokemonImage(id: 4)
        async let squirtleImage = generatePokemonImage(id: 7)
        
        let (bulbaImage, charImage, squirtImage) = await (bulbasaurImage, charmanderImage, squirtleImage)
        
        return (bulbaImage, charImage, squirtImage)
    }
}

extension IntroViewModel {
    func displayNextMessage() {
        Task {
            if introMessageCounter < IntroMessages.introLines.count {
                delegate?.setIntroMessage(message: IntroMessages.introLines[introMessageCounter])
                introMessageCounter += 1
            } else if newJourneyMessageCounter < NewJourneyMessages.newJourneyLines.count {
                if newJourneyMessageCounter == 2 {
                    guard let safePlayerName = playerName else { return }
                    if safePlayerName.isEmpty {
                        print("playerName is not being recorded from the textfield")
                        return
                    } else {
                        delegate?.removePlayerNameView()
                        await savePlayerName()
                        delegate?.setNewJourneyMessage(message: NewJourneyMessages.newQuestMessage2(playerName: safePlayerName))
                    }
                } else if newJourneyMessageCounter == 7 {
                    guard let selectedPokemon = playerSelectedPokemon else {
                        print("Starter Pokemon not selected yet. Please select starter pokemon")
                        return
                    }
                    delegate?.displaySelectedPokemonImage(selectedPokemon: selectedPokemon)
                    await savePlayerStarterPokemon(selectedPokemon: selectedPokemon)
                    delegate?.setNewJourneyMessage(message: NewJourneyMessages.newQuestMessage7(selectedPokemon: selectedPokemon.name))
                } else if newJourneyMessageCounter == 10 {
                    guard let selectedPokemon = playerSelectedPokemon else {
                        print("playerSelectedPokemon is nil - error")
                        return
                    }
                    self.pokemonLocationConfiguration.addRivalTrainer(playerStarterPokemon: selectedPokemon)
                    let rivalPokemonConfiguration = selectRivalPokemon(playerStarterPokemon: selectedPokemon)
                    delegate?.displayRivalPokemonImage(rivalPokemon: rivalPokemonConfiguration)
                    delegate?.setNewJourneyMessage(message: NewJourneyMessages.newQuestMessage10(selectedPokemon: rivalPokemonConfiguration.name))
                } else if newJourneyMessageCounter == 11 {
                    delegate?.removePokemonImage()
                    guard let safePlayerName = playerName else { return }
                    delegate?.setNewJourneyMessage(message: NewJourneyMessages.newQuestMessage11(playerName: safePlayerName))
                } else {
                    if newJourneyMessageCounter == 1 {
                        delegate?.setPlayerNameView()
                    }
                    if newJourneyMessageCounter == 6 {
                        delegate?.setStarterPokemonOptionsView()
                    }
                    if newJourneyMessageCounter == 8 {
                        delegate?.removePokemonImage()
                    }
                    delegate?.setNewJourneyMessage(message: NewJourneyMessages.newJourneyLines[newJourneyMessageCounter])
                }
                newJourneyMessageCounter += 1
            } else {
//                coordinateToBattle()
            }
        }
    }
    
    func dismissPokemonSelection() {
        self.playerSelectedPokemon = nil
        delegate?.setNewJourneyMessage(message: NewJourneyMessages.newQuestMessage6)
    }
    
//    func displayPokemonSelectedMessage(message: String, selectedPokemon: PokemonIdNameConfiguration) {
//        self.playerSelectedPokemon = selectedPokemon
//        Task {
//            await self.introView.introTextView.animateMessage(message: message)
//        }
//    }
}

// MARK: - Selecting Rival Starter Pokemon
extension IntroViewModel {
    func selectRivalPokemon(playerStarterPokemon: PokemonIdNameConfiguration) -> PokemonIdNameConfiguration {
        switch playerStarterPokemon {
        case .bulbasaur:
            return .charmander
        case .charmander:
            return .squirtle
        case .squirtle:
            return .bulbasaur
        default:
            return .eevee
        }
    }
}

// MARK: - Saving Player information
extension IntroViewModel {
    func savePlayerName() async {
        do {
            guard let safePlayerName = playerName else { return }
            try await coreDataNetworkService.saveGamePlayerModel(playerName: safePlayerName)
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

// MARK: - Coordinate to Battle Rival Ash
//extension IntroViewModel {
//    func coordinateToBattle() {
//        let battleConfiguration = PokemonBattleConfiguration(trainer: pokemonLocationConfiguration.trainers?[0])
//        controller?.coordinateToBattleScreen(configuration: battleConfiguration)
//    }
//}
