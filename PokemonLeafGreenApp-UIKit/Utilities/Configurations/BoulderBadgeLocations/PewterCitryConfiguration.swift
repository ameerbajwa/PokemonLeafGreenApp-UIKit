//
//  PewterCitryConfiguration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

struct PewterCityConfiguration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var trainers: [any PokemonTrainerConfiguration]?
    var wildPokemon: [any WildPokemonConfiguration]?
    
    init() {
        self.id = 6
        self.name = "Pewter City"
        self.trainers = nil
        self.wildPokemon = nil
    }
}
