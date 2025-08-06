//
//  Route2Configuration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

struct Route2Configuration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var trainers: [PokemonTrainerConfiguration]?
    var wildPokemon: [WildPokemonConfiguration]?
    
    init() {
        self.id = 4
        self.name = "Route 2"
        self.trainers = nil
        self.wildPokemon = [WildPokemon(id: 16,
                                        name: "pidgey",
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 45),
                            WildPokemon(id: 19,
                                        name: "rattata",
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 45),
                            WildPokemon(id: 10,
                                        name: "caterpie",
                                        lowestLevel: 4,
                                        highestLevel: 5,
                                        rate: 5),
                            WildPokemon(id: 13,
                                        name: "weedle",
                                        lowestLevel: 4,
                                        highestLevel: 5,
                                        rate: 5)]
    }
}
