//
//  StartViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/4/25.
//

import Foundation
import UIKit

protocol StartViewModeling: AnyObject {
    func generatePokemonImages() async -> (Data?, Data?)
    
    func startNewGame()
    func loadGame()
}

class StartViewModel: StartViewModeling {
    var pokeAPINetworkService: PokeAPINetworkService
    var coreDataNetworkService: CoreDataNetworkService
        
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
    }
}

// MARK: - PokeAPI network call

extension StartViewModel {
    func generatePokemonImages() async -> (Data?, Data?) {
        var pokemonIds = [3,6]
        let attackingPokemonIndex = Int.random(in: 0...1)
        let attackingPokemonId = pokemonIds.remove(at: attackingPokemonIndex)
        let defendingPokemonId = pokemonIds[0]
        let attackingPokemonImageRequest = PokeAPIImageRequest(endpoint: .backImage, id: attackingPokemonId)
        let defendingPokemonImageRequest = PokeAPIImageRequest(endpoint: .frontImage, id: defendingPokemonId)
        
        do {
            let attackingPokemonImageData = try await pokeAPINetworkService.retrievePokeAPIImageData(with: attackingPokemonImageRequest)
            let defendingPokemonImageData = try await pokeAPINetworkService.retrievePokeAPIImageData(with: defendingPokemonImageRequest)
            
            return (attackingPokemonImageData, defendingPokemonImageData)
        } catch {
            return (nil, nil)
        }
    }
}

// MARK: - CoreData network call

extension StartViewModel {
    func loadGame() {
        do {
            let coreDataGamePlayerFetchRequest = CoreDataRequest<CoreDataGamePlayer>(identifierKey: #keyPath(CoreDataGamePlayer.id), identifierIntValue: 1)
            let _ = try coreDataNetworkService.fetchCoreDataModel(with: coreDataGamePlayerFetchRequest)
            // coordinate to location based on saved PokemonLocationConfiguration
        } catch {
            print("Player could not be found, must start new game")
        }
    }
}

// MARK: - Coordinate to IntroViewController

extension StartViewModel {
    func startNewGame() {
        Task {
            do {
                try await coreDataNetworkService.saveNewGamePlayerModel()
            } catch let error as PokemonLeafGreenError {
                print(error.errorLogDescription)
                print(error.clientDescription)
            } catch {
                print("#ERROR# - Unknown reason - \(error.localizedDescription)")
            }
        }
    }
}
