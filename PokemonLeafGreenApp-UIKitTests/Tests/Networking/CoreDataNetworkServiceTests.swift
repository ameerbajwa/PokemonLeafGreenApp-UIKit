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
    var mockDecoder: JSONDecoder!
    
    override func setUp() {
        mockDecoder = JSONDecoder()
    }
    
    func testSavingThenFetchingCoreDataPokemonModel() async {
        mockPersistentContainer = MockPersistentContainer.makeInMemoryPersistentContainer()
        coreDataNetworkService = CoreDataNetworkService(container: mockPersistentContainer)
        
        let pokeAPIPokemonMockData = Data(PokeAPIMocks.PokeAPIPokemonMock.utf8)
        let pokeAPIPokemonSpeciesMockData = Data(PokeAPIMocks.PokeAPIPokemonSpeciesMock.utf8)
        var pokeAPIPokemonMockResponse: PokeAPIPokemonDetails!
        var pokeAPIPokemonSpeciesMockResponse: PokeAPIPokemonSpeciesDetails!
        
        do {
            pokeAPIPokemonMockResponse = try mockDecoder.decode(PokeAPIPokemonDetails.self, from: pokeAPIPokemonMockData)
            pokeAPIPokemonSpeciesMockResponse = try mockDecoder.decode(PokeAPIPokemonSpeciesDetails.self, from: pokeAPIPokemonSpeciesMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        do {
            try await coreDataNetworkService.saveCoreDataPokemonModel(pokeAPIPokemon: pokeAPIPokemonMockResponse, pokeAPIPokemonSpecies: pokeAPIPokemonSpeciesMockResponse)
        } catch {
            XCTFail("Could not save correct CoreDataPokemon model after adapting PokeAPI mock data to mock CoreData")
        }
        
        do {
            let mockCoreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifier: "clefairy")
            let mockCoreDataPokemonModel = try coreDataNetworkService.fetchCoreDataModel(with: mockCoreDataFetchRequest)
            
            XCTAssertEqual(mockCoreDataPokemonModel.id, 35)
            
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
}
