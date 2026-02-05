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
    var encounterRival: Bool
    
    init() {
        self.id = PokemonLocationIdNamePokemonConfiguration.palletTown.id
        self.name = PokemonLocationIdNamePokemonConfiguration.palletTown.name
        self.pokemonConfigurations = PokemonLocationIdNamePokemonConfiguration.palletTown.pokemonConfigurations
        self.wildPokemon = nil
        self.encounterRival = true
    }
}

extension PalletTownConfiguration {
    mutating func addRivalTrainer(playerStarterPokemon: PokemonIdNameConfiguration) {
        var rivalAshStarterPokemon: PokemonIdNameConfiguration
        switch playerStarterPokemon {
        case .bulbasaur:
            rivalAshStarterPokemon = .charmander
        case .charmander:
            rivalAshStarterPokemon = .squirtle
        case .squirtle:
            rivalAshStarterPokemon = .bulbasaur
        default:
            rivalAshStarterPokemon = .eevee
        }
        var rivalAsh = PokemonTrainer(order: 1, id: 1, name: "Ash", reward: 100)
        rivalAsh.pokemon.append(PokemonTrainerPokemon(order: 1,
                                                      id: rivalAshStarterPokemon.id,
                                                      name: rivalAshStarterPokemon.name,
                                                      level: 5))
        self.trainers = [rivalAsh]
    }
}
