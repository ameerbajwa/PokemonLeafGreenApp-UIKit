//
//  CoreDataMocks.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/27/25.
//

import Foundation
import CoreData
import XCTest
@testable import PokemonLeafGreenApp_UIKit

struct CoreDataMocks {
    func saveCoreDataMoveObject(mockContext: NSManagedObjectContext) {
        let coreDataMove = CoreDataMove(context: mockContext)
        coreDataMove.id = 1
        coreDataMove.name = "pound"
        coreDataMove.pp = 35
        coreDataMove.power = 40
        coreDataMove.accuracy = 100
        coreDataMove.moveType = "normal"
        coreDataMove.moveDescription = "A physical attack delivered with a long tail or a foreleg, etc."
        
        let coreDataMoveStatChange = CoreDataMoveStatChange(context: mockContext)
        coreDataMoveStatChange.change = -1
        coreDataMoveStatChange.statName = "defense"
        coreDataMove.addToStatChanges(coreDataMoveStatChange)
        
        do {
            try mockContext.save()
        } catch {
            XCTFail("Could not save mock object to mock container of CoreData")
        }
    }
    
    func saveCoreDataPokemonObject(mockContext: NSManagedObjectContext) {
        let coreDataPokemon = CoreDataPokemon(context: mockContext)
        coreDataPokemon.id = 35
        coreDataPokemon.name = "clefairy"
        coreDataPokemon.baseExperience = 113
        coreDataPokemon.type = "fairy"
        coreDataPokemon.type2 = nil
        coreDataPokemon.growthRate = "medium-slow"
        coreDataPokemon.pokemonDescription = "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON."
        coreDataPokemon.frontImageUrlString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/35.png"
        coreDataPokemon.backImageUrlString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/35.png"
        
        let coreDataPokemonStat = CoreDataPokemonStat(context: mockContext)
        coreDataPokemonStat.name = "speed"
        coreDataPokemonStat.baseValue = 35
        coreDataPokemonStat.effortValue = 0
        coreDataPokemonStat.individualValue = Int16(Int.random(in: 1...31))
        coreDataPokemon.addToStats(coreDataPokemonStat)
        
        let coreDataPokemonMoveList = CoreDataPokemonMoveList(context: mockContext)
        coreDataPokemonMoveList.id = 1
        coreDataPokemonMoveList.name = "pound"
        coreDataPokemonMoveList.levelLearnedAt = 1
        coreDataPokemon.addToMoves(coreDataPokemonMoveList)
        
        do {
            try mockContext.save()
        } catch {
            XCTFail("Could not save mock object to mock container of CoreData")
        }
    }
}
