//
//  PokemonBattleReadyAdapter.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/15/25.
//

public enum PokemonBattleNames: String {
    case currentValue = "currentValue"
    case baseValue = "baseValue"
    case effortValue = "effortValue"
    case individualValue = "individualValue"
}

public struct PokemonBattleReadyAdapter {
    init() {}
    
    func adaptPokemonModelsToPokemonFullBattleInfo(coreDataPokemonModel: CoreDataPokemon, coreDataMoveModels: [CoreDataMove]) -> PokemonBattleMoveInfo {
        
    }
    
    func adaptPlayerPokemonToPokemonFullBattleInfo(coreDataGamePlayerPokemonModel: CoreDataGamePlayerPokemon, coreDataPokemonModel: CoreDataPokemon, coreDataMoveModels: [CoreDataMove]) -> PokemonFullBattleInfo {
        var pokemonStats = [String:[String:Int]]()
        var newStatInfo = [String:Int]()
        
        if let statList = coreDataPokemonModel.stats as? Set<CoreDataPokemonStat> {
            for stat in statList {
                newStatInfo[PokemonBattleNames.baseValue.rawValue] = Int(stat.baseValue)
                newStatInfo[PokemonBattleNames.effortValue.rawValue] = Int(stat.effortValue)
                newStatInfo[PokemonBattleNames.individualValue.rawValue] = Int(stat.individualValue)
                newStatInfo[PokemonBattleNames.currentValue.rawValue] = calculatedStatValueForPokemon(stat: stat, level: Int(coreDataGamePlayerPokemonModel.level))
                pokemonStats[stat.name] = newStatInfo
                newStatInfo.removeAll()
            }
        }
        
        return PokemonFullBattleInfo(
            order: Int(coreDataGamePlayerPokemonModel.order),
            id: Int(coreDataPokemonModel.id),
            name: coreDataPokemonModel.name,
            level: Int(coreDataGamePlayerPokemonModel.level),
            pokemonDescription: coreDataPokemonModel.pokemonDescription,
            frontImageUrlString: coreDataPokemonModel.frontImageUrlString,
            backImageUrlString: coreDataPokemonModel.backImageUrlString,
            type: coreDataPokemonModel.type,
            type2: coreDataPokemonModel.type2,
            pokemonMovesInfo: coreDataMoveModels,
            pokemonStatsInfo: pokemonStats)
    }
    
    func calculatedStatValueForPokemon(stat: CoreDataPokemonStat, level: Int) -> Int {
        // do the math
    }
    
}
