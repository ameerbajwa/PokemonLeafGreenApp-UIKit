//
//  PokemonLocationConfigurationDoublyLinkedList.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 1/31/26.
//

class PokemonLocationConfigurationNode {
    var configuration: PokemonLocationConfiguration
    var previousConfiguration: PokemonLocationConfigurationNode?
    var nextConfiguration: PokemonLocationConfigurationNode?
    
    init(configuration: PokemonLocationConfiguration) {
        self.configuration = configuration
    }
}

public class PokemonLocationConfigurationDoublyLinkedList {
    var startLocation: PokemonLocationConfigurationNode?
    var lastLocation: PokemonLocationConfigurationNode?
    
    init() {}
    
    func appendLocation(configuration: PokemonLocationConfiguration) {
        let newPokemonLocationConfigurationNode = PokemonLocationConfigurationNode(configuration: configuration)
        
        guard lastLocation != nil else {
            startLocation = newPokemonLocationConfigurationNode
            lastLocation = newPokemonLocationConfigurationNode
            return
        }
        
        lastLocation?.nextConfiguration = newPokemonLocationConfigurationNode
        newPokemonLocationConfigurationNode.previousConfiguration = lastLocation
        self.lastLocation = newPokemonLocationConfigurationNode
    }
    
    func findLocation(locationName: String) -> PokemonLocationConfigurationNode? {
        var currentLocationNode = startLocation
        
        while currentLocationNode != nil {
            if currentLocationNode?.configuration.name == locationName {
                return currentLocationNode
            }
            currentLocationNode = currentLocationNode?.nextConfiguration
        }
        
        return nil
    }
}
