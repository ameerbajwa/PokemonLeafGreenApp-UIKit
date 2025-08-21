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
        self.wildPokemon = nil
    }
    
    mutating func provideRivalAshPokemonConfiguration(playerStarterPokemon: PokemonIdNameConfiguration) -> PokemonIdNameConfiguration {
        let rivalAshStarterPokemon = returnRivalStarterPokemon(playerStarterPokemon: playerStarterPokemon)
        var rivalAsh = PokemonTrainer(order: 1, id: 1, name: "Rival Ash", reward: 100)
        rivalAsh.pokemon.append(PokemonTrainerPokemon(order: 1,
                                                      id: rivalAshStarterPokemon.id,
                                                      name: rivalAshStarterPokemon.name,
                                                      level: 5))
        self.trainers = [rivalAsh]
        return rivalAshStarterPokemon
    }
}

extension PalletTownConfiguration {
    private func returnRivalStarterPokemon(playerStarterPokemon: PokemonIdNameConfiguration) -> PokemonIdNameConfiguration {
        if playerStarterPokemon == .bulbasaur {
            return .charmander
        } else if playerStarterPokemon == .charmander {
            return .squirtle
        } else {
            return .bulbasaur
        }
    }
}
