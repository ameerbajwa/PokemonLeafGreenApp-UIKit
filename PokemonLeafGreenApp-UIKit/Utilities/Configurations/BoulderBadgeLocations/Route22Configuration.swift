//
//  Route22Configuration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

struct Route22Configuration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var trainers: [PokemonTrainerConfiguration]?
    var wildPokemon: [WildPokemonConfiguration]?
    
    init() {
        self.id = 3
        self.name = "Route 22"
        self.trainers = nil
        self.wildPokemon = [WildPokemon(id: 21,
                                        name: "spearow",
                                        lowestLevel: 3,
                                        highestLevel: 5,
                                        rate: 10),
                            WildPokemon(id: 19,
                                        name: "rattata",
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 45),
                            WildPokemon(id: 56,
                                        name: "mankey",
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 45)]
    }
}
