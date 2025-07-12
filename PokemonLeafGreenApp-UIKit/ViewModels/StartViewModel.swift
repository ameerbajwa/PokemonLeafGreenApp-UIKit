//
//  StartViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/4/25.
//

import Foundation
import UIKit

protocol StartViewModeling: AnyObject {
    var controllerView: UIView? { get set }
    func generatePokemonImages() async -> (UIImage?, UIImage?)
}

public class StartViewModel: StartViewModeling {
    var pokeAPINetworkService: PokeAPINetworkService
    var startView: StartView
    weak var controllerView: UIView?
    
    init(pokeAPINetworkService: PokeAPINetworkService, startView: StartView) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.startView = startView
        self.startView.viewModel = self
    }
    
    func generatePokemonImages() async -> (UIImage?, UIImage?) {
        var pokemonIds = [3,6] // venasaur and charizard pokemon ids on pokeapi
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
