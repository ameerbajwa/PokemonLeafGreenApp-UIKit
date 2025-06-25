//
//  PokeAPICoreDataAdapterTests.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/23/25.
//

import Foundation
import CoreData
import XCTest
@testable import PokemonLeafGreenApp_UIKit

class PokeAPICoreDataAdapterTests: XCTestCase {
    var adapter: PokeAPICoreDataAdapter!
    var mockPersistentContainer: NSPersistentContainer!
    var mockContext: NSManagedObjectContext!
    var decoder: JSONDecoder!
    
    override func setUp() {
        mockPersistentContainer = MockPersistentContainer.makeInMemoryPersistentContainer()
        mockContext = mockPersistentContainer.viewContext
        adapter = PokeAPICoreDataAdapter(coreDataContext: mockContext)
        decoder = JSONDecoder()
    }
    
    override func tearDown() {
        decoder = nil
        adapter = nil
        mockContext = nil
        mockPersistentContainer = nil
    }
    
    func testAdaptMovetoCoreDataMove() {
        let pokeAPIMoveMockData = Data(PokeAPIMocks.PokeAPIMove.utf8)
        var pokeAPIMoveMockResponse: PokeAPIMoveDetails!
        
        do {
            pokeAPIMoveMockResponse = try decoder.decode(PokeAPIMoveDetails.self, from: pokeAPIMoveMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        let coreDataMove = adapter.adaptMoveToCoreData(pokeAPIMove: pokeAPIMoveMockResponse)
        
        XCTAssertEqual(coreDataMove.id, 1)
        XCTAssertEqual(coreDataMove.name, "pound")
        XCTAssertEqual(coreDataMove.accuracy, 100)
        XCTAssertEqual(coreDataMove.pp, 35)
        XCTAssertEqual(coreDataMove.power, 40)
        XCTAssertEqual(coreDataMove.moveType, "normal")
        XCTAssertEqual(coreDataMove.moveDescription, "A physical attack delivered with a long tail or a foreleg, etc.")
        
        if let coreDataMoveStatChanges = coreDataMove.statChanges as? Set<CoreDataMoveStatChange> {
            if let coreDataMoveStatChange = coreDataMoveStatChanges.first {
                XCTAssertEqual(coreDataMoveStatChange.change, -1)
                XCTAssertEqual(coreDataMoveStatChange.statName, "defense")
            }
        }
    }
    
    func testAdaptPokemonToCoreDataPokemon() {
        let pokeAPIPokemonMockData = Data(PokeAPIMocks.PokeAPIPokemonMock.utf8)
        let pokeAPIPokemonSpeciesMockData = Data(PokeAPIMocks.PokeAPIPokemonSpeciesMock.utf8)
        var pokeAPIPokemonMockResponse: PokeAPIPokemonDetails!
        var pokeAPIPokemonSpeciesMockResponse: PokeAPIPokemonSpeciesDetails!
        
        do {
            pokeAPIPokemonMockResponse = try decoder.decode(PokeAPIPokemonDetails.self, from: pokeAPIPokemonMockData)
            pokeAPIPokemonSpeciesMockResponse = try decoder.decode(PokeAPIPokemonSpeciesDetails.self, from: pokeAPIPokemonSpeciesMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        let coreDataPokemon = adapter.adaptPokemonToCoreData(pokeAPIPokemon: pokeAPIPokemonMockResponse, pokeAPIPokemonSpecies: pokeAPIPokemonSpeciesMockResponse)
        
        XCTAssertEqual(coreDataPokemon.id, 35)
        XCTAssertEqual(coreDataPokemon.name, "clefairy")
        XCTAssertEqual(coreDataPokemon.baseExperience, 113)
        XCTAssertEqual(coreDataPokemon.type, "fairy")
        XCTAssertEqual(coreDataPokemon.type2, nil)
        XCTAssertEqual(coreDataPokemon.growthRate, "medium-slow")
        XCTAssertEqual(coreDataPokemon.pokemonDescription, "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
        XCTAssertEqual(coreDataPokemon.frontImageUrlString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/35.png")
        XCTAssertEqual(coreDataPokemon.backImageUrlString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/35.png")
        
        if let coreDataPokemonStats = coreDataPokemon.stats as? Set<CoreDataPokemonStat> {
            if let coreDataPokemonStat = coreDataPokemonStats.first {
                XCTAssertEqual(coreDataPokemonStat.name, "speed")
                XCTAssertEqual(coreDataPokemonStat.baseValue, 35)
                XCTAssertEqual(coreDataPokemonStat.effortValue, 0)
            }
        }
        
        if let coreDataPokemonMoves = coreDataPokemon.moves as? Set<CoreDataPokemonMoveList> {
            if let coreDataPokemonMove = coreDataPokemonMoves.first {
                XCTAssertEqual(coreDataPokemonMove.id, 1)
                XCTAssertEqual(coreDataPokemonMove.name, "pound")
                XCTAssertEqual(coreDataPokemonMove.levelLearnedAt, 1)
            }
        }
    }
}
