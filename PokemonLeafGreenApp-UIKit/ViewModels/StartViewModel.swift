//
//  StartViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/4/25.
//

import Foundation
import UIKit

protocol StartViewModeling: AnyObject {
    func animateTitle(titleLabel: UILabel)
    func generatePokemonImages() async -> (UIImage?, UIImage?)
}

public class StartViewModel: StartViewModeling {
    var pokeAPINetworkService: PokeAPINetworkService
    var startView: StartView
    var animationTimer: Timer?
    
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
    
    func animateTitle(titleLabel: UILabel) {
        var currentIndex = 0
        let titleMessage = "Pokemon LeafGreen Game App"
        titleLabel.text = ""
        
        let interval = TimeInterval(3.0) / Double(titleMessage.count)
        
        animationTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            guard currentIndex < titleMessage.count else {
                timer.invalidate()
                return
            }
            
            let index = titleMessage.index(titleMessage.startIndex, offsetBy: currentIndex)
            titleLabel.text?.append(titleMessage[index])
            currentIndex += 1
        }
    }
}
