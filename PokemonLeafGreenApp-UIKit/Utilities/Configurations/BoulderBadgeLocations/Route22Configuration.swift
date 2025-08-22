//
//  Route22Configuration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

struct Route22Configuration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var pokemonConfigurations: [PokemonIdNameConfiguration]?
    var trainers: [PokemonTrainerConfiguration]?
    var wildPokemon: [WildPokemonConfiguration]?
    
    init() {
        self.id = PokemonLocationIdNamePokemonConfiguration.route22.id
        self.name = PokemonLocationIdNamePokemonConfiguration.route22.name
        self.pokemonConfigurations = PokemonLocationIdNamePokemonConfiguration.route22.pokemonConfigurations
        self.trainers = nil
        self.wildPokemon = [WildPokemon(id: PokemonIdNameConfiguration.spearow.id,
                                        name: PokemonIdNameConfiguration.spearow.name,
                                        lowestLevel: 3,
                                        highestLevel: 5,
                                        rate: 10),
                            WildPokemon(id: PokemonIdNameConfiguration.rattata.id,
                                        name: PokemonIdNameConfiguration.rattata.name,
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 45),
                            WildPokemon(id: PokemonIdNameConfiguration.mankey.id,
                                        name: PokemonIdNameConfiguration.mankey.name,
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 45)]
    }
    
    mutating func provideRivalAshPokemonConfiguration(starterPokemon: PokemonIdNameConfiguration) {
        var rivalAsh = PokemonTrainer(order: 1, id: 1, name: "Rival Ash", reward: 144)
        rivalAsh.pokemon.append(PokemonTrainerPokemon(order: 1,
                                                      id: PokemonIdNameConfiguration.pidgey.id,
                                                      name: PokemonIdNameConfiguration.pidgey.name,
                                                      level: 9))
        rivalAsh.pokemon.append(PokemonTrainerPokemon(order: 2,
                                                      id: starterPokemon.id,
                                                      name: starterPokemon.name,
                                                      level: 9))
        
        self.trainers = [rivalAsh]
    }
}
