//
//  PokeAPIMockTest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/10/25.
//

import XCTest
@testable import PokemonLeafGreenApp_UIKit

final class PokeAPIMockTest: XCTestCase {
    var decoder: JSONDecoder!
    
    override func setUp() {
        decoder = JSONDecoder()
    }
    
    override func tearDown() {
        decoder = nil
    }
    
    func testPokeAPIPokemonMockWithCorrectData() {
        let pokeAPIPokemonMockData = Data(PokeAPIMocks.PokeAPIPokemonMock.utf8)
        var pokeAPIPokemonMockResponse: PokeAPIPokemonDetails!
        
        do {
            pokeAPIPokemonMockResponse = try decoder.decode(PokeAPIPokemonDetails.self, from: pokeAPIPokemonMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        XCTAssertEqual(pokeAPIPokemonMockResponse.id, 35)
        XCTAssertEqual(pokeAPIPokemonMockResponse.name, "clefairy")
        XCTAssertEqual(pokeAPIPokemonMockResponse.baseExperience, 113)
        XCTAssertEqual(pokeAPIPokemonMockResponse.moves[0].move.name, "pound")
        XCTAssertEqual(pokeAPIPokemonMockResponse.moves[0].versionGroupDetails[0].levelLearnedAt, 1)
        XCTAssertEqual(pokeAPIPokemonMockResponse.moves[0].versionGroupDetails[0].versionGroup.name, "firered-leafgreen")
        XCTAssertEqual(pokeAPIPokemonMockResponse.sprites.versions.generationIII.leafGreen.frontImageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/35.png")
        XCTAssertEqual(pokeAPIPokemonMockResponse.sprites.versions.generationIII.leafGreen.backImageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/35.png")
        XCTAssertEqual(pokeAPIPokemonMockResponse.stats[0].baseStat, 35)
        XCTAssertEqual(pokeAPIPokemonMockResponse.stats[0].effort, 0)
        XCTAssertEqual(pokeAPIPokemonMockResponse.stats[0].stat.name, "speed")
        XCTAssertEqual(pokeAPIPokemonMockResponse.types[0].typeDetails.name, "fairy")
    }
    
    func testPokeAPIPokemonMockWhenMockDataIsCorrupt() {
        let pokeAPIPokemonCorruptedMock = Data(PokeAPIMocks.PokeAPIPokemonMockCorrupted.utf8)
        
        do {
            _ = try decoder.decode(PokeAPIPokemonDetails.self, from: pokeAPIPokemonCorruptedMock)
        } catch {
            XCTAssert(true)
            return
        }
        
        XCTFail("Mock should not be decodable")
    }
    
    func testPokeAPIPokemonSpeciesMockWithCorrectData() {
        let pokeAPIPokemonSpeciesMockData = Data(PokeAPIMocks.PokeAPIPokemonSpeciesMock.utf8)
        var pokeAPIPokemonSpeciesMockResponse: PokeAPIPokemonSpeciesDetails!
        
        do {
            pokeAPIPokemonSpeciesMockResponse = try decoder.decode(PokeAPIPokemonSpeciesDetails.self, from: pokeAPIPokemonSpeciesMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        XCTAssertEqual(pokeAPIPokemonSpeciesMockResponse.id, 1)
        XCTAssertEqual(pokeAPIPokemonSpeciesMockResponse.name, "bulbasaur")
        XCTAssertEqual(pokeAPIPokemonSpeciesMockResponse.growthRate.name, "medium-slow")
        XCTAssertEqual(pokeAPIPokemonSpeciesMockResponse.evolutionChain.url, "https://pokeapi.co/api/v2/evolution-chain/1/")
        XCTAssertEqual(pokeAPIPokemonSpeciesMockResponse.descriptionDetails[0].description, "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
        XCTAssertEqual(pokeAPIPokemonSpeciesMockResponse.descriptionDetails[0].language.name, "en")
        XCTAssertEqual(pokeAPIPokemonSpeciesMockResponse.descriptionDetails[0].version.name, "red")
    }
    
    func testPokeAPIPokemonSpeciesMockWhenMockDataIsCorrupt() {
        let pokeAPIPokemonSpeciesCorruptMockData = Data(PokeAPIMocks.PokeAPIPokemonSpeciesMockCorrupted.utf8)
        
        do {
            _ = try decoder.decode(PokeAPIPokemonSpeciesDetails.self, from: pokeAPIPokemonSpeciesCorruptMockData)
        } catch {
            XCTAssert(true)
            return
        }
        
        XCTFail("Mock should not be decodable")
    }
    
    func testPokeAPIMoveMockWithCorrectData() {
        let pokeAPIMoveMockData = Data(PokeAPIMocks.PokeAPIMove.utf8)
        var pokeAPIMoveMockResponse: PokeAPIMoveDetails!
        
        do {
            pokeAPIMoveMockResponse = try decoder.decode(PokeAPIMoveDetails.self, from: pokeAPIMoveMockData)
        } catch {
            XCTFail("Could not decode mock data")
        }
        
        XCTAssertEqual(pokeAPIMoveMockResponse.id, 1)
        XCTAssertEqual(pokeAPIMoveMockResponse.name, "pound")
        XCTAssertEqual(pokeAPIMoveMockResponse.accuracy, 100)
        XCTAssertEqual(pokeAPIMoveMockResponse.pp, 35)
        XCTAssertEqual(pokeAPIMoveMockResponse.power, 40)
        XCTAssertEqual(pokeAPIMoveMockResponse.moveType.name, "normal")
        XCTAssertEqual(pokeAPIMoveMockResponse.moveDescription[0].description, "A physical attack delivered with a long tail or a foreleg, etc.")
        XCTAssertEqual(pokeAPIMoveMockResponse.moveDescription[0].language.name, "en")
        XCTAssertEqual(pokeAPIMoveMockResponse.moveDescription[0].version.name, "firered-leafgreen")
    }
    
    func testPokeAPIMoveMockWhenMockDataIsCorrupt() {
        let pokeAPIMoveCorruptMockData = Data(PokeAPIMocks.PokeAPIMoveCorrupted.utf8)
        
        do {
            _ = try decoder.decode(PokeAPIMoveDetails.self, from: pokeAPIMoveCorruptMockData)
        } catch {
            XCTAssert(true)
            return
        }
        
        XCTFail("Mock should not be decodable")
    }
}
