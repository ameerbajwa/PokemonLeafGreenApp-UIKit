//
//  PewterCityConfiguration.swift
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
        self.wildPokemon = nil
        
        var camperLiam = PokemonTrainer(order: 1, id: 1, name: "Camper Liam", reward: 220)
        camperLiam.pokemon.append(PokemonTrainerPokemon(order: 1, id: 74, name: "geodude", level: 10))
        camperLiam.pokemon.append(PokemonTrainerPokemon(order: 2, id: 27, name: "sandshrew", level: 11))
        
        var leaderBrock = PokemonTrainer(order: 2, id: 2, name: "Leader Brock", reward: 650, isGymLeader: true)
        leaderBrock.pokemon.append(PokemonTrainerPokemon(order: 1, id: 74, name: "geodude", level: 12))
        leaderBrock.pokemon.append(PokemonTrainerPokemon(order: 2, id: 95, name: "onix", level: 14))
        
        self.trainers = [camperLiam, leaderBrock]
    }
}
