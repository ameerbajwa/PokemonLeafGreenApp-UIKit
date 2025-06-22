//
//  PokeAPICoreDataAdapter.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/19/25.
//

import Foundation
import CoreData

struct PokeAPICoreDataAdapter {
    let coreDataContext: NSManagedObjectContext
    
    init() {
        self.coreDataContext = AppDelegate().persistentContainer.viewContext
    }
    
    func adaptMoveToCoreData(pokeAPIMove: PokeAPIMoveDetails) -> CoreDataMove {
        let coreDataMove = CoreDataMove(context: coreDataContext)
        coreDataMove.adaptPokeAPIMoveModelToCoreDataMoveModel(pokeAPIMoveModel: pokeAPIMove)
        
        if pokeAPIMove.statChanges.count > 0 {
            for statChange in pokeAPIMove.statChanges {
                coreDataMove.addToStatChanges(adaptStatChangeToCoreData(pokeAPIStatChange: statChange))
            }
        }
        
        return coreDataMove
    }
    
    func adaptStatChangeToCoreData(pokeAPIStatChange: PokeAPIMoveStatChangeDetails) -> CoreDataMoveStatChange {
        let coreDataMoveStatChange = CoreDataMoveStatChange(context: coreDataContext)
        coreDataMoveStatChange.adaptPokeAPIMoveStatChangeToCoreDataMoveStatChange(pokeAPIMoveStatChange: pokeAPIStatChange)
        return coreDataMoveStatChange
    }
    
    func adaptPokemonToCoreData(pokeAPIPokemon: PokeAPIPokemonDetails, pokeAPIPokemonSpecies: PokeAPIPokemonSpeciesDetails) -> CoreDataPokemon {
        let coreDataPokemon = CoreDataPokemon(context: coreDataContext)
        coreDataPokemon.adaptPokeAPIPokemonToCoreDataPokemon(pokeAPIPokemon: pokeAPIPokemon, pokeAPIPokemonSpecies: pokeAPIPokemonSpecies)
        
        var adjustedMoveList = [PokeAPIPokemonMoveDetails]()
        for move in pokeAPIPokemon.moves {
            let adjustedMoveDetails = move.versionGroupDetails.filter { versionGroupDetails in
                versionGroupDetails.versionGroup.name == "firered-leafgreen" && versionGroupDetails.moveLearnMethod.name == "level-up"
            }

            adjustedMoveList.append(PokeAPIPokemonMoveDetails(move: move.move, versionGroupDetails: adjustedMoveDetails))
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
        coreDataPokemonMoveList.adaptPokeAPIMoveListToCoreDataPokemonMoveList(pokeAPIPokemonMoveDetails: pokeAPIPokemonMove)
        return coreDataPokemonMoveList
    }
    
    func adaptPokemonStatToCoreData(pokeAPIPokemonStat: PokeAPIPokemonStatDetails) -> CoreDataPokemonStat {
        let coreDataPokemonStat = CoreDataPokemonStat(context: coreDataContext)
        coreDataPokemonStat.adaptPokeAPIStatToCoreDataPokemonStat(pokeAPIStat: pokeAPIPokemonStat)
        return coreDataPokemonStat
    }
}
