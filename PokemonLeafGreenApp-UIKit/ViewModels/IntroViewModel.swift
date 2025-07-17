//
//  IntroViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/12/25.
//

import Foundation
import UIKit

class IntroViewModel {
    var pokeAPINetworkService: PokeAPINetworkService
    var coreDataNetworkService: CoreDataNetworkService
    var introView: IntroView
    
    var introMessages: [String]
    var introMessageCounter = 0
    
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, introView: IntroView) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.introView = introView
        
        self.introMessages = [IntroMessages.introWelcomeMessage,
                              IntroMessages.introExplanationMessage,
                              IntroMessages.introExplanationExamplesMessage,
                              IntroMessages.introExplanationExamplesMessage2,
                              IntroMessages.introEnjoyMessage]
        
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
        self.introView.introTextView.animateIntroMessage(message: introMessages[introMessageCounter])
        introMessageCounter += 1
    }
}
