//
//  CoreDataMockTest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/22/25.
//

import XCTest
import CoreData
@testable import PokemonLeafGreenApp_UIKit

final class CoreDataMockTest: XCTestCase {
    var mockPersistentContainer: NSPersistentContainer!
    var mockContext: NSManagedObjectContext!
    var decoder: JSONDecoder!
    
    override func setUp() {
        mockPersistentContainer = MockPersistentContainer.makeInMemoryPersistentContainer()
        mockContext = mockPersistentContainer.viewContext
        decoder = JSONDecoder()
    }
    
    override func tearDown() {
        mockPersistentContainer = nil
        mockContext = nil
        decoder = nil
    }
    
    func testAdaptCoreDataMove() {
        let pokeAPIMoveMockData = Data(PokeAPIMocks.PokeAPIMove.utf8)
        var pokeAPIMoveMockResponse: PokeAPIMoveDetails!
        
        do {
            pokeAPIMoveMockResponse = try decoder.decode(PokeAPIMoveDetails.self, from: pokeAPIMoveMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        let coreDataMove = CoreDataMove(context: mockContext)
        coreDataMove.adapt(pokeAPIMoveModel: pokeAPIMoveMockResponse)
        
        XCTAssertEqual(coreDataMove.id, 1)
        XCTAssertEqual(coreDataMove.name, "pound")
        XCTAssertEqual(coreDataMove.accuracy, 100)
        XCTAssertEqual(coreDataMove.pp, 35)
        XCTAssertEqual(coreDataMove.power, 40)
        XCTAssertEqual(coreDataMove.moveType, "normal")
        XCTAssertEqual(coreDataMove.moveDescription, "A physical attack delivered with a long tail or a foreleg, etc.")
    }
    
    func testAdaptCoreDataMoveStatChange() {
        let pokeAPIMoveStatChangeMockData = Data(PokeAPIMocks.PokeAPIMoveStatChange.utf8)
        var pokeAPIMoveStatChangeMockResponse: PokeAPIMoveStatChangeDetails!
        
        do {
            pokeAPIMoveStatChangeMockResponse = try decoder.decode(PokeAPIMoveStatChangeDetails.self, from: pokeAPIMoveStatChangeMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        let coreDataMoveStatChange = CoreDataMoveStatChange(context: mockContext)
        coreDataMoveStatChange.adapt(pokeAPIMoveStatChange: pokeAPIMoveStatChangeMockResponse)
        
        XCTAssertEqual(coreDataMoveStatChange.change, -1)
        XCTAssertEqual(coreDataMoveStatChange.statName, "attack")
    }
    
    func testAdaptCoreDataPokemon() {
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
        
        let coreDataPokemon = CoreDataPokemon(context: mockContext)
        coreDataPokemon.adapt(pokeAPIPokemon: pokeAPIPokemonMockResponse, pokeAPIPokemonSpecies: pokeAPIPokemonSpeciesMockResponse)
        
        XCTAssertEqual(coreDataPokemon.id, 35)
        XCTAssertEqual(coreDataPokemon.name, "clefairy")
        XCTAssertEqual(coreDataPokemon.baseExperience, 113)
        XCTAssertEqual(coreDataPokemon.type, "fairy")
        XCTAssertEqual(coreDataPokemon.type2, nil)
        XCTAssertEqual(coreDataPokemon.growthRate, "medium-slow")
        XCTAssertEqual(coreDataPokemon.pokemonDescription, "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
        XCTAssertEqual(coreDataPokemon.frontImageUrlString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/35.png")
        XCTAssertEqual(coreDataPokemon.backImageUrlString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/35.png")
    }
    
    func testAdaptCoreDataPokemonMoveList() {
        let pokeAPIPokemonMockData = Data(PokeAPIMocks.PokeAPIPokemonMock.utf8)
        var pokeAPIPokemonMockResponse: PokeAPIPokemonDetails!
        
        do {
            pokeAPIPokemonMockResponse = try decoder.decode(PokeAPIPokemonDetails.self, from: pokeAPIPokemonMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        let pokeAPIPokemonMoveListMockResponse: PokeAPIPokemonMoveDetails = pokeAPIPokemonMockResponse.moves[0]
        
        let coreDataPokemonMoveList = CoreDataPokemonMoveList(context: mockContext)
        coreDataPokemonMoveList.adapt(pokeAPIPokemonMoveDetails: pokeAPIPokemonMoveListMockResponse)
        
        XCTAssertEqual(coreDataPokemonMoveList.id, 1)
        XCTAssertEqual(coreDataPokemonMoveList.name, "pound")
        XCTAssertEqual(coreDataPokemonMoveList.levelLearnedAt, 1)
    }
    
    func testAdaptCoreDataPokemonStat() {
        let pokeAPIPokemonMockData = Data(PokeAPIMocks.PokeAPIPokemonMock.utf8)
        var pokeAPIPokemonMockResponse: PokeAPIPokemonDetails!
        
        do {
            pokeAPIPokemonMockResponse = try decoder.decode(PokeAPIPokemonDetails.self, from: pokeAPIPokemonMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        let pokeAPIPokemonStatMockResponse: PokeAPIPokemonStatDetails = pokeAPIPokemonMockResponse.stats[0]
        
        let coreDataPokemonStat = CoreDataPokemonStat(context: mockContext)
        coreDataPokemonStat.adapt(pokeAPIStat: pokeAPIPokemonStatMockResponse)
        
        XCTAssertEqual(coreDataPokemonStat.name, "speed")
        XCTAssertEqual(coreDataPokemonStat.baseValue, 35)
        XCTAssertEqual(coreDataPokemonStat.effortValue, 0)
    }
}
