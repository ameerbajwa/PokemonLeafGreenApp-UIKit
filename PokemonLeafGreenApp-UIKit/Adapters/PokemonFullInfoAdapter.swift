//
//  PokemonFullInfoAdapter.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/15/25.
//

public enum PokemonStatNames: String {
    case currentValue = "currentValue"
    case baseValue = "baseValue"
    case effortValue = "effortValue"
    case individualValue = "individualValue"
    case hp = "hp"
    case attack = "attack"
    case defense = "defense"
    case specialAttack = "special-attack"
    case specialDefense = "special-defense"
    case speed = "speed"
}

public struct PokemonFullInfoAdapter {
    init() {}
    
    func adaptPlayerPokemonEffortValueStats(
        playerPokemonModel: CoreDataGamePlayerPokemon
    ) -> [String:Int] {
        var effortValueEarnedDictionary = [String:Int]()
        effortValueEarnedDictionary[PokemonStatNames.hp.rawValue] = Int(playerPokemonModel.effortValueEarnedForHP)
        effortValueEarnedDictionary[PokemonStatNames.attack.rawValue] = Int(playerPokemonModel.effortValueEarnedForAttack)
        effortValueEarnedDictionary[PokemonStatNames.defense.rawValue] = Int(playerPokemonModel.effortValueEarnedForDefense)
        effortValueEarnedDictionary[PokemonStatNames.specialAttack.rawValue] = Int(playerPokemonModel.effortValueEarnedForSpecialAttack)
        effortValueEarnedDictionary[PokemonStatNames.specialDefense.rawValue] = Int(playerPokemonModel.effortValueEarnedForSpecialDefense)
        effortValueEarnedDictionary[PokemonStatNames.speed.rawValue] = Int(playerPokemonModel.effortValueEarnedForSpeed)
        return effortValueEarnedDictionary
    }
    
    func adaptPokemonModelsToFullInfo(
        pokemonLevel: Int,
        pokemonOrder: Int? = nil,
        pokemonEffortEarnedValues: [String:Int]? = nil,
        coreDataPokemonModel: CoreDataPokemon,
        coreDataMoveModels: [CoreDataMove]
    ) -> PokemonFullInfo {
        var pokemonStats = [String:[String:Int]]()
        var newStatInfo = [String:Int]()
        
        if let statList = coreDataPokemonModel.stats as? Set<CoreDataPokemonStat> {
            for stat in statList {
                newStatInfo[PokemonStatNames.baseValue.rawValue] = Int(stat.baseValue)
                newStatInfo[PokemonStatNames.effortValue.rawValue] = Int(stat.effortValue)
                newStatInfo[PokemonStatNames.individualValue.rawValue] = Int(stat.individualValue)
                newStatInfo[PokemonStatNames.currentValue.rawValue] = calculateStatValueForPokemon(stat: stat, level: pokemonLevel, effortEarned: min(pokemonEffortEarnedValues?[stat.name] ?? 0, 252))
                pokemonStats[stat.name] = newStatInfo
                newStatInfo.removeAll()
            }
        }
        
        return PokemonFullInfo(
            order: pokemonOrder,
            id: Int(coreDataPokemonModel.id),
            name: coreDataPokemonModel.name,
            level: pokemonLevel,
            pokemonDescription: coreDataPokemonModel.pokemonDescription,
            frontImageUrlString: coreDataPokemonModel.frontImageUrlString,
            backImageUrlString: coreDataPokemonModel.backImageUrlString,
            type: coreDataPokemonModel.type,
            type2: coreDataPokemonModel.type2,
            pokemonMovesInfo: coreDataMoveModels,
            pokemonStatsInfo: pokemonStats)
    }
    
    func calculateStatValueForPokemon(
        stat: CoreDataPokemonStat,
        level: Int,
        effortEarned: Int
    ) -> Int {
        let doubleStatValue = 2 * Int(stat.baseValue)
        let quarterEffortEarned = effortEarned / 4
        let combinedStatCalculation = doubleStatValue + Int(stat.individualValue) + quarterEffortEarned
        let combinedStatCalculationAccordingToLevel = ((combinedStatCalculation * level) / 100)
        if stat.name == PokemonStatNames.hp.rawValue {
            return combinedStatCalculationAccordingToLevel + level + 10
        } else {
            return combinedStatCalculationAccordingToLevel + 5
        }
    }
}
