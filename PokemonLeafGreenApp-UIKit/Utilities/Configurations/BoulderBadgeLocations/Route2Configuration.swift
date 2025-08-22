//
//  Route2Configuration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

struct Route2Configuration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var pokemonConfigurations: [PokemonIdNameConfiguration]?
    var trainers: [PokemonTrainerConfiguration]?
    var wildPokemon: [WildPokemonConfiguration]?
    
    init() {
        self.id = PokemonLocationIdNamePokemonConfiguration.route2.id
        self.name = PokemonLocationIdNamePokemonConfiguration.route2.name
        self.pokemonConfigurations = PokemonLocationIdNamePokemonConfiguration.route2.pokemonConfigurations
        self.trainers = nil
        self.wildPokemon = [WildPokemon(id: PokemonIdNameConfiguration.pidgey.id,
                                        name: PokemonIdNameConfiguration.pidgey.name,
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 45),
                            WildPokemon(id: PokemonIdNameConfiguration.rattata.id,
                                        name: PokemonIdNameConfiguration.rattata.name,
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 45),
                            WildPokemon(id: PokemonIdNameConfiguration.caterpie.id,
                                        name: PokemonIdNameConfiguration.caterpie.name,
                                        lowestLevel: 4,
                                        highestLevel: 5,
                                        rate: 5),
                            WildPokemon(id: PokemonIdNameConfiguration.weedle.id,
                                        name: PokemonIdNameConfiguration.weedle.name,
                                        lowestLevel: 4,
                                        highestLevel: 5,
                                        rate: 5)]
    }
}
