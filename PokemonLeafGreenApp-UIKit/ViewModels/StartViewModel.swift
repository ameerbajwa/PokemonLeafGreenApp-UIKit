//
//  StartViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/4/25.
//

import Foundation
import UIKit

protocol StartViewModeling: AnyObject {
    var startController: StartViewController? { get set }
    func generatePokemonImages() async -> (UIImage?, UIImage?)
    
    func startNewGame()
    func loadGame()
}

class StartViewModel: StartViewModeling {
    var pokeAPINetworkService: PokeAPINetworkService
    var coreDataNetworkService: CoreDataNetworkService
    var startView: StartView
    weak var startController: StartViewController?
    
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, startView: StartView) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.startView = startView
    }
}

// MARK: - Animation chain for StartViewController
extension StartViewModel {
    func animateScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.startView.animateTitle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.50) {
            self.startView.animateAttackerImage()
            self.startView.animateDefenderImage()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.75) {
            self.startView.buttonStackView.isHidden = false
        }
    }
}

// MARK: - PokeAPI network call

extension StartViewModel {
    func generatePokemonImages() async -> (UIImage?, UIImage?) {
        var pokemonIds = [3,6]
        let attackingPokemonIndex = Int.random(in: 0...1)
        let attackingPokemonId = pokemonIds.remove(at: attackingPokemonIndex)
        let defendingPokemonId = pokemonIds[0]
        let attackingPokemonImageRequest = PokeAPIImageRequest(endpoint: .backImage, id: attackingPokemonId)
        let defendingPokemonImageRequest = PokeAPIImageRequest(endpoint: .frontImage, id: defendingPokemonId)
        
        do {
            let attackingPokemonImageData = try await pokeAPINetworkService.retrievePokeAPIImageData(with: attackingPokemonImageRequest)
            let defendingPokemonImageData = try await pokeAPINetworkService.retrievePokeAPIImageData(with: defendingPokemonImageRequest)
            
            let attackingPokemonImage = UIImage(data: attackingPokemonImageData)
            let defendingPokemonImage = UIImage(data: defendingPokemonImageData)
            
            return (attackingPokemonImage, defendingPokemonImage)
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
                await startController?.coordinateToIntroScreen()
            } catch let error as PokemonLeafGreenError {
                print(error.errorLogDescription)
                print(error.clientDescription)
            } catch {
                print("#ERROR# - Unknown reason - \(error.localizedDescription)")
            }
        }
    }
}
