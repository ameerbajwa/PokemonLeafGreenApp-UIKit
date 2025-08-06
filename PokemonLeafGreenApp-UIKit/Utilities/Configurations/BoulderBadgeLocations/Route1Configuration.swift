//
//  Route1Configuration.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

struct Route1Configuration: PokemonLocationConfiguration {
    var id: Int
    var name: String
    var trainers: [PokemonTrainerConfiguration]?
    var wildPokemon: [WildPokemonConfiguration]?
    
    init() {
        self.id = 1
        self.name = "Route 1"
        self.trainers = nil
        self.wildPokemon = [WildPokemon(id: 16,
                                        name: "pidgey",
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 50),
                            WildPokemon(id: 19,
                                        name: "rattata",
                                        lowestLevel: 2,
                                        highestLevel: 5,
                                        rate: 50)]
    }
}
