//
//  ViridianForestConfiguration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

struct ViridianForestConfiguration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var trainers: [PokemonTrainerConfiguration]?
    var wildPokemon: [WildPokemonConfiguration]?
    
    init() {
        self.id = PokemonLocationIdNameConfiguration.virdianForest.id
        self.name = PokemonLocationIdNameConfiguration.virdianForest.name
        self.wildPokemon = [WildPokemon(id: PokemonIdNameConfiguration.caterpie.id,
                                        name: PokemonIdNameConfiguration.caterpie.name,
                                        lowestLevel: 3,
                                        highestLevel: 5,
                                        rate: 35),
                            WildPokemon(id: PokemonIdNameConfiguration.metapod.id,
                                        name: PokemonIdNameConfiguration.metapod.name,
                                        lowestLevel: 4,
                                        highestLevel: 6,
                                        rate: 10),
                            WildPokemon(id: PokemonIdNameConfiguration.weedle.id,
                                        name: PokemonIdNameConfiguration.weedle.name,
                                        lowestLevel: 3,
                                        highestLevel: 5,
                                        rate: 35),
                            WildPokemon(id: PokemonIdNameConfiguration.kakuna.id,
                                        name: PokemonIdNameConfiguration.kakuna.name,
                                        lowestLevel: 4,
                                        highestLevel: 6,
                                        rate: 10),
                            WildPokemon(id: PokemonIdNameConfiguration.pikachu.id,
                                        name: PokemonIdNameConfiguration.pikachu.name,
                                        lowestLevel: 3,
                                        highestLevel: 5,
                                        rate: 10)]
        
        var bugCatcherRick = PokemonTrainer(order: 1, id: 1, name: "Bug Catcher Rick", reward: 72)
        bugCatcherRick.pokemon.append(PokemonTrainerPokemon(order: 1, id: PokemonIdNameConfiguration.weedle.id, name: PokemonIdNameConfiguration.weedle.name, level: 6))
        bugCatcherRick.pokemon.append(PokemonTrainerPokemon(order: 2, id: PokemonIdNameConfiguration.caterpie.id, name: PokemonIdNameConfiguration.caterpie.name, level: 6))
        
        var bugCatcherDoug = PokemonTrainer(order: 2, id: 2, name: "Bug Catcher Doug", reward: 84)
        bugCatcherDoug.pokemon.append(PokemonTrainerPokemon(order: 1, id: PokemonIdNameConfiguration.weedle.id, name: PokemonIdNameConfiguration.weedle.name, level: 7))
        bugCatcherDoug.pokemon.append(PokemonTrainerPokemon(order: 2, id: PokemonIdNameConfiguration.kakuna.id, name: PokemonIdNameConfiguration.kakuna.name, level: 7))
        bugCatcherDoug.pokemon.append(PokemonTrainerPokemon(order: 3, id: PokemonIdNameConfiguration.weedle.id, name: PokemonIdNameConfiguration.weedle.name, level: 7))
        
        var bugCatcherAnthony = PokemonTrainer(order: 3, id: 3, name: "Bug Catcher Anthony", reward: 96)
        bugCatcherAnthony.pokemon.append(PokemonTrainerPokemon(order: 1, id: PokemonIdNameConfiguration.caterpie.id, name: PokemonIdNameConfiguration.caterpie.name, level: 7))
        bugCatcherAnthony.pokemon.append(PokemonTrainerPokemon(order: 2, id: PokemonIdNameConfiguration.caterpie.id, name: PokemonIdNameConfiguration.caterpie.name, level: 8))
        
        var bugCatcherCharlie = PokemonTrainer(order: 4, id: 4, name: "Bug Catcher Charlie", reward: 84)
        bugCatcherCharlie.pokemon.append(PokemonTrainerPokemon(order: 1, id: PokemonIdNameConfiguration.metapod.id, name: PokemonIdNameConfiguration.metapod.name, level: 7))
        bugCatcherCharlie.pokemon.append(PokemonTrainerPokemon(order: 2, id: PokemonIdNameConfiguration.caterpie.id, name: PokemonIdNameConfiguration.caterpie.name, level: 7))
        bugCatcherCharlie.pokemon.append(PokemonTrainerPokemon(order: 3, id: PokemonIdNameConfiguration.metapod.id, name: PokemonIdNameConfiguration.metapod.name, level: 7))
        
        var bugCatcherSammy = PokemonTrainer(order: 5, id: 5, name: "Bug Catcher Sammy", reward: 108)
        bugCatcherSammy.pokemon.append(PokemonTrainerPokemon(order: 1, id: PokemonIdNameConfiguration.weedle.id, name: PokemonIdNameConfiguration.weedle.name, level: 9))
        
        self.trainers = [bugCatcherRick, bugCatcherDoug, bugCatcherAnthony, bugCatcherCharlie, bugCatcherSammy]
    }
}
