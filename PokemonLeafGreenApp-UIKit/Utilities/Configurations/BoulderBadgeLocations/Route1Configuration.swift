//
//  Route1Configuration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

struct Route1Configuration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var pokemonConfigurations: [PokemonIdNameConfiguration]?
    var trainers: [PokemonTrainerConfiguration]?
    var wildPokemon: [WildPokemonConfiguration]?
    
    init() {
        self.id = PokemonLocationIdNamePokemonConfiguration.route1.id
        self.name = PokemonLocationIdNamePokemonConfiguration.route1.name
        self.pokemonConfigurations = PokemonLocationIdNamePokemonConfiguration.route1.pokemonConfigurations
        self.trainers = nil
        self.wildPokemon = [WildPokemon(id: PokemonIdNameConfiguration.pidgey.id,
                                        name: PokemonIdNameConfiguration.pidgey.name,
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 50),
                            WildPokemon(id: PokemonIdNameConfiguration.rattata.id,
                                        name: PokemonIdNameConfiguration.rattata.name,
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 50)]
    }
}
