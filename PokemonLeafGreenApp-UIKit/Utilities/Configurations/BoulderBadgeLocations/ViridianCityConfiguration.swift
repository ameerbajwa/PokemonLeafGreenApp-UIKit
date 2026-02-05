//
//  ViridianCityConfiguration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 1/31/26.
//

struct ViridianCityConfiguration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var pokemonConfigurations: [PokemonIdNameConfiguration]?
    var trainers: [any PokemonTrainerConfiguration]?
    var wildPokemon: [any WildPokemonConfiguration]?
    var encounterRival: Bool
    
    init() {
        self.id = PokemonLocationIdNamePokemonConfiguration.virdianCity.id
        self.name = PokemonLocationIdNamePokemonConfiguration.virdianCity.name
        self.pokemonConfigurations = PokemonLocationIdNamePokemonConfiguration.virdianCity.pokemonConfigurations
        self.wildPokemon = nil
        self.trainers = nil
        self.encounterRival = false
    }
}

extension ViridianCityConfiguration {
    mutating func addRivalTrainer(playerStarterPokemon: PokemonIdNameConfiguration) {}
}
