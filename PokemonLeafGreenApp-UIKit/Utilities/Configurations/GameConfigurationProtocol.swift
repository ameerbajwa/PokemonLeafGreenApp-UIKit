//
//  ConfigurationProtocol.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/5/25.
//

public protocol PokemonLocationConfiguration {
    var id: Int { get set }
    var name: String { get set }
    var trainers: [PokemonTrainerConfiguration]? { get set }
    var wildPokemon: [WildPokemonConfiguration]? { get set }
}

public protocol WildPokemonConfiguration {
    var id: Int { get set }
    var name: String { get set }
    var lowestLevel: Int { get set }
    var highestLevel: Int { get set }
    var rate: Int { get set }
}

struct WildPokemon: WildPokemonConfiguration {
    var id: Int
    var name: String
    var lowestLevel: Int
    var highestLevel: Int
    var rate: Int
    
    init(id: Int, name: String, lowestLevel: Int, highestLevel: Int, rate: Int) {
        self.id = id
        self.name = name
        self.lowestLevel = lowestLevel
        self.highestLevel = highestLevel
        self.rate = rate
    }
}

public protocol PokemonTrainerConfiguration {
    var order: Int { get set }
    var id: Int { get set }
    var name: String { get set }
    var reward: Int { get set }
    var isGymLeader: Bool { get set }
    var pokemon: [PokemonTrainerPokemonConfiguration] { get set }
}

struct PokemonTrainer: PokemonTrainerConfiguration {
    var order: Int
    var id: Int
    var name: String
    var reward: Int
    var isGymLeader: Bool
    var pokemon: [PokemonTrainerPokemonConfiguration] = []
    
    init(order: Int, id: Int, name: String, reward: Int, isGymLeader: Bool = false) {
        self.order = order
        self.id = id
        self.name = name
        self.reward = reward
        self.isGymLeader = isGymLeader
    }
}

public protocol PokemonTrainerPokemonConfiguration {
    var order: Int { get set }
    var id: Int { get set }
    var name: String { get set }
    var level: Int { get set }
}

struct PokemonTrainerPokemon: PokemonTrainerPokemonConfiguration {
    var order: Int
    var id: Int
    var name: String
    var level: Int
    
    init(order: Int, id: Int, name: String, level: Int) {
        self.order = order
        self.id = id
        self.name = name
        self.level = level
    }
}
