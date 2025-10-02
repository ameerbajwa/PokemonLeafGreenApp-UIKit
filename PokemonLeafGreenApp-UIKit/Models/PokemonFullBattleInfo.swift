//
//  PokemonFullBattleInfo.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/10/25.
//

import Foundation

protocol PokemonFullBattleInfoProtocol {
    var order: Int? { get set }
    var id: Int { get set }
    var name: String { get set }
    var level: Int { get set }
    var baseExperience: Int? { get set }
    var currentExperience: Int? { get set }
    var growthRate: String? { get set }
    var pokemonDescription: String { get set }
    var frontImageUrlString: String { get set }
    var backImageUrlString: String { get set }
    var type: String { get set }
    var type2: String? { get set }
    var pokemonMovesInfo: [CoreDataMove] { get set }
    var pokemonStatsInfo: [String:[String:Int]] { get set }
}

struct PokemonFullBattleInfo: PokemonFullBattleInfoProtocol {
    var order: Int?
    var id: Int
    var name: String
    var level: Int
    var baseExperience: Int?
    var currentExperience: Int?
    var growthRate: String?
    var pokemonDescription: String
    var frontImageUrlString: String
    var backImageUrlString: String
    var type: String
    var type2: String?
    var pokemonMovesInfo: [CoreDataMove]
    var pokemonStatsInfo: [String:[String:Int]]
    
    init(order: Int?, id: Int, name: String, level: Int, baseExperience: Int? = nil, currentExperience: Int? = nil, growthRate: String? = nil, pokemonDescription: String, frontImageUrlString: String, backImageUrlString: String, type: String, type2: String? = nil, pokemonMovesInfo: [CoreDataMove], pokemonStatsInfo: [String:[String:Int]]) {
        self.order = order
        self.id = id
        self.name = name
        self.level = level
        self.baseExperience = baseExperience
        self.currentExperience = currentExperience
        self.growthRate = growthRate
        self.pokemonDescription = pokemonDescription
        self.frontImageUrlString = frontImageUrlString
        self.backImageUrlString = backImageUrlString
        self.type = type
        self.type2 = type2
        self.pokemonMovesInfo = pokemonMovesInfo
        self.pokemonStatsInfo = pokemonStatsInfo
    }
}
