//
//  PokeAPICoreDataAdapter.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/19/25.
//

import Foundation
import CoreData

public struct PokeAPICoreDataAdapter {
    var coreDataContext: NSManagedObjectContext
    
    init(coreDataContext: NSManagedObjectContext) {
        self.coreDataContext = coreDataContext
    }
    
    func adaptMoveToCoreData(pokeAPIMove: PokeAPIMoveDetails) -> CoreDataMove {
        let coreDataMove = CoreDataMove(context: coreDataContext)
        coreDataMove.adapt(pokeAPIMoveModel: pokeAPIMove)
        
        if pokeAPIMove.statChanges.count > 0 {
            for statChange in pokeAPIMove.statChanges {
                coreDataMove.addToStatChanges(adaptStatChangeToCoreData(pokeAPIStatChange: statChange))
            }
        }
        
        return coreDataMove
    }
    
    func adaptStatChangeToCoreData(pokeAPIStatChange: PokeAPIMoveStatChangeDetails) -> CoreDataMoveStatChange {
        let coreDataMoveStatChange = CoreDataMoveStatChange(context: coreDataContext)
        coreDataMoveStatChange.adapt(pokeAPIMoveStatChange: pokeAPIStatChange)
        return coreDataMoveStatChange
    }
    
    func adaptPokemonToCoreData(pokeAPIPokemon: PokeAPIPokemonDetails, pokeAPIPokemonSpecies: PokeAPIPokemonSpeciesDetails) -> CoreDataPokemon {
        let coreDataPokemon = CoreDataPokemon(context: coreDataContext)
        coreDataPokemon.adapt(pokeAPIPokemon: pokeAPIPokemon, pokeAPIPokemonSpecies: pokeAPIPokemonSpecies)
        
        var adjustedMoveList = [PokeAPIPokemonMoveDetails]()
        for move in pokeAPIPokemon.moves {
            let adjustedMoveDetails = move.versionGroupDetails.filter { versionGroupDetails in
                versionGroupDetails.versionGroup.name == CommonAppMessages.pokemonGameVersion && versionGroupDetails.moveLearnMethod.name == CommonAppMessages.levelUpMethod
            }

            if !adjustedMoveDetails.isEmpty {
                adjustedMoveList.append(PokeAPIPokemonMoveDetails(move: move.move, versionGroupDetails: adjustedMoveDetails))
            }
        }
        
        for move in adjustedMoveList {
            coreDataPokemon.addToMoves(adaptPokemonMoveListToCoreData(pokeAPIPokemonMove: move))
        }
        
        for stat in pokeAPIPokemon.stats {
            coreDataPokemon.addToStats(adaptPokemonStatToCoreData(pokeAPIPokemonStat: stat))
        }
        
        return coreDataPokemon
    }
    
    func adaptPokemonMoveListToCoreData(pokeAPIPokemonMove: PokeAPIPokemonMoveDetails) -> CoreDataPokemonMoveList {
        let coreDataPokemonMoveList = CoreDataPokemonMoveList(context: coreDataContext)
        coreDataPokemonMoveList.adapt(pokeAPIPokemonMoveDetails: pokeAPIPokemonMove)
        return coreDataPokemonMoveList
    }
    
    func adaptPokemonStatToCoreData(pokeAPIPokemonStat: PokeAPIPokemonStatDetails) -> CoreDataPokemonStat {
        let coreDataPokemonStat = CoreDataPokemonStat(context: coreDataContext)
        coreDataPokemonStat.adapt(pokeAPIStat: pokeAPIPokemonStat)
        return coreDataPokemonStat
    }
}
