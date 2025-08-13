//
//  PalletTownConfiguration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/11/25.
//

import Foundation

struct PalletTownConfiguration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var pokemonConfigurations: [PokemonIdNameConfiguration]?
    var trainers: [any PokemonTrainerConfiguration]?
    var wildPokemon: [any WildPokemonConfiguration]?
    
    init() {
        self.id = PokemonLocationIdNamePokemonConfiguration.palletTown.id
        self.name = PokemonLocationIdNamePokemonConfiguration.palletTown.name
        self.pokemonConfigurations = PokemonLocationIdNamePokemonConfiguration.palletTown.pokemonConfigurations
        self.wildPokemon = [WildPokemon(id: PokemonIdNameConfiguration.bulbasaur.id,
                                        name: PokemonIdNameConfiguration.bulbasaur.name,
                                        lowestLevel: 5,
                                        highestLevel: 5,
                                        rate: 33),
                            WildPokemon(id: PokemonIdNameConfiguration.charmander.id,
                                        name: PokemonIdNameConfiguration.charmander.name,
                                        lowestLevel: 5,
                                        highestLevel: 5,
                                        rate: 33),
                            WildPokemon(id: PokemonIdNameConfiguration.squirtle.id,
                                        name: PokemonIdNameConfiguration.squirtle.name,
                                        lowestLevel: 5,
                                        highestLevel: 5,
                                        rate: 33)]
        
    }
    
    mutating func provideRivalAshPokemonConfiguration(starterPokemon: PokemonIdNameConfiguration) {
        var rivalAsh = PokemonTrainer(order: 1, id: 1, name: "Rival Ash", reward: 100)
        rivalAsh.pokemon.append(PokemonTrainerPokemon(order: 1,
                                                      id: starterPokemon.id,
                                                      name: starterPokemon.name,
                                                      level: 5))
        self.trainers = [rivalAsh]
    }
}
