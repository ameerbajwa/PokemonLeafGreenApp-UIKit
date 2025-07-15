//
//  CoreDataNetworkServiceTests.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/26/25.
//

import Foundation
import XCTest
import CoreData
@testable import PokemonLeafGreenApp_UIKit

class CoreDataNetworkServiceTests: XCTestCase {
    var mockPersistentContainer: NSPersistentContainer!
    var coreDataNetworkService: CoreDataNetworkService!
    var pokeAPIMocks: PokeAPIMocks!
    var coreDataMocks: CoreDataMocks!
    var mockDecoder: JSONDecoder!
    
    
    override func setUp() {
        mockPersistentContainer = MockPersistentContainer.makeInMemoryPersistentContainer()
        coreDataNetworkService = CoreDataNetworkService(container: mockPersistentContainer)
        mockDecoder = JSONDecoder()
        pokeAPIMocks = PokeAPIMocks()
        coreDataMocks = CoreDataMocks()
    }
    
    override func tearDown() {
        coreDataNetworkService = nil
        mockPersistentContainer = nil
        pokeAPIMocks = nil
        coreDataMocks = nil
        mockDecoder = nil
    }
    
    func testSavingThenFetchingCoreDataPokemonModel() async {
        guard let (pokeAPIPokemonMockResponse, pokeAPIPokemonSpeciesMockResponse) = pokeAPIMocks.returnPokeAPIPokemonMockResponses(mockDecoder: mockDecoder) else {
            XCTFail("Could not decode mock pokeAPI response PokeAPIPokemonDetails/PokeAPIPokemonSpeciesDetails")
            return
        }
        
        do {
            try await coreDataNetworkService.saveCoreDataPokemonModel(pokeAPIPokemon: pokeAPIPokemonMockResponse, pokeAPIPokemonSpecies: pokeAPIPokemonSpeciesMockResponse)
        } catch {
            XCTFail("Could not save correct CoreDataPokemon model after adapting PokeAPI mock data to mock CoreData")
        }
        
        do {
            let mockCoreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierValue: "clefairy")
            let mockCoreDataPokemonModel = try coreDataNetworkService.fetchCoreDataModel(with: mockCoreDataFetchRequest)
                        
            XCTAssertEqual(mockCoreDataPokemonModel.id, 35)
            XCTAssertEqual(mockCoreDataPokemonModel.name, "clefairy")
            XCTAssertEqual(mockCoreDataPokemonModel.baseExperience, 113)
            XCTAssertEqual(mockCoreDataPokemonModel.type, "fairy")
            XCTAssertEqual(mockCoreDataPokemonModel.type2, nil)
            XCTAssertEqual(mockCoreDataPokemonModel.growthRate, "medium-slow")
            XCTAssertEqual(mockCoreDataPokemonModel.pokemonDescription, "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
            XCTAssertEqual(mockCoreDataPokemonModel.frontImageUrlString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/35.png")
            XCTAssertEqual(mockCoreDataPokemonModel.backImageUrlString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/35.png")
            
            if let coreDataPokemonStats = mockCoreDataPokemonModel.stats as? Set<CoreDataPokemonStat> {
                if let coreDataPokemonStat = coreDataPokemonStats.first {
                    XCTAssertEqual(coreDataPokemonStat.name, "speed")
                    XCTAssertEqual(coreDataPokemonStat.baseValue, 35)
                    XCTAssertEqual(coreDataPokemonStat.effortValue, 0)
                }
            }
            
            if let coreDataPokemonMoves = mockCoreDataPokemonModel.moves as? Set<CoreDataPokemonMoveList> {
                if let coreDataPokemonMove = coreDataPokemonMoves.first {
                    XCTAssertEqual(coreDataPokemonMove.id, 1)
                    XCTAssertEqual(coreDataPokemonMove.name, "pound")
                    XCTAssertEqual(coreDataPokemonMove.levelLearnedAt, 1)
                }
            }
        } catch {
            XCTFail("Could not fetch correct CoreDataPokemon model after adapting PokeAPI mock data to mock CoreData")
        }
    }
    
    func testSavingThenFetchingCoreDataMoveModel() async {
        guard let pokeAPIMoveMockResponse = pokeAPIMocks.returnPokeAPIMoveMockResponse(mockDecoder: mockDecoder) else {
            XCTFail("Could not decode pokeAPI response PokeAPIMoveDetails")
            return
        }
        
        do {
            try await coreDataNetworkService.saveCoreDataMoveModel(pokeAPIMove: pokeAPIMoveMockResponse)
        } catch {
            XCTFail("Failed to save mock CoreDataMove object to mock CoreData")
        }
        
        do {
            let mockCoreDataFetchRequest = CoreDataRequest<CoreDataMove>(identifierKey: #keyPath(CoreDataMove.name), identifierValue: "pound")
            let mockCoreDataMoveModel = try coreDataNetworkService.fetchCoreDataModel(with: mockCoreDataFetchRequest)
            
            XCTAssertEqual(mockCoreDataMoveModel.id, 1)
            XCTAssertEqual(mockCoreDataMoveModel.name, "pound")
            XCTAssertEqual(mockCoreDataMoveModel.accuracy, 100)
            XCTAssertEqual(mockCoreDataMoveModel.moveType, "normal")
            XCTAssertEqual(mockCoreDataMoveModel.power, 40)
            XCTAssertEqual(mockCoreDataMoveModel.pp, 35)
            XCTAssertEqual(mockCoreDataMoveModel.moveDescription, "A physical attack delivered with a long tail or a foreleg, etc.")
            
            if let mockCoreDataMoveStatChanges = mockCoreDataMoveModel.statChanges as? Set<CoreDataMoveStatChange> {
                if let mockCoreDataMoveStatChange = mockCoreDataMoveStatChanges.first {
                    XCTAssertEqual(mockCoreDataMoveStatChange.change, -1)
                    XCTAssertEqual(mockCoreDataMoveStatChange.statName, "defense")
                }
            }
        } catch {
            XCTFail("Could not fetch correct CoreDataMove model after adapting PokeAPI mock data to mock CoreData")
        }
    }
    
    func testFetchingCoreDataModelNotSaved() {
        do {
            let mockCoreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierValue: "charmander")
             _ = try coreDataNetworkService.fetchCoreDataModel(with: mockCoreDataFetchRequest)
        } catch let error as PokemonLeafGreenError {
            XCTAssertEqual(error.errorLogDescription, "No record found in Core Data model CoreDataPokemon for key-value pair - name - charmander")
        } catch {
            XCTFail("Wrong error has been thrown")
        }
    }
}
