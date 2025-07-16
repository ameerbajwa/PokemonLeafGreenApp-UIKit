//
//  PokeAPINetworkServiceTests.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/12/25.
//

import Foundation
import XCTest
@testable import PokemonLeafGreenApp_UIKit

class PokeAPINetworkServiceTests: XCTestCase {
    var pokeAPINetworkService: PokeAPINetworkService!
    var mockSession: URLSession!
    
    override func setUp() {
        URLProtocol.registerClass(MockURLProtocol.self)
    }
    
    override func tearDown() {
        URLProtocol.unregisterClass(MockURLProtocol.self)
    }
    
    func testCallPokeAPIServerWithPokemonEndpointExpectErrorResponse() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .pokemon, id: 35)
        let mockResponse = Data("Not Found".utf8)
        
        MockURLProtocol.mockData = mockResponse
        MockURLProtocol.mockResponse = HTTPURLResponse(
            url: URL(string: "https://pokeapi.co/api/v2/pokemon35")!,
            statusCode: 400,
            httpVersion: nil,
            headerFields: nil
        )
        
        mockSession = URLSession(configuration: .ephemeral)
        pokeAPINetworkService = PokeAPINetworkService(session: mockSession, decoder: JSONDecoder())
        
        Task {
            do {
                _ = try await pokeAPINetworkService.callPokeAPIServer(with: request)
            } catch let error as PokemonLeafGreenError {
                XCTAssertEqual(error.debugDescription, "PokeAPI server error - 400\nError description: Not Found")
                XCTAssertEqual(error.errorLogDescription, "Server is down. Please refresh the app or download again.")
            }
        }
    }
    
    func testCallPokeAPIServerWithPokemonEndpointWithNoURLResponseExpectErrorResponse() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(endpoint: .pokemon, id: 35)
        
        MockURLProtocol.mockData = Data(PokeAPIMocks.PokeAPIPokemonMock.utf8)
        MockURLProtocol.mockResponse = nil
        
        mockSession = URLSession(configuration: .ephemeral)
        pokeAPINetworkService = PokeAPINetworkService(session: mockSession, decoder: JSONDecoder())
        
        Task {
            do {
                _ = try await pokeAPINetworkService.callPokeAPIServer(with: request)
            } catch let error as PokemonLeafGreenError {
                XCTAssertEqual(error.errorLogDescription, "Could not convert URLResponse object to HTTPURLResponse")
                XCTAssertEqual(error.clientDescription, "Server is down. Please refresh the app or download again.")
            }
        }
    }
}

// MARK: - PokeAPINetworkService Tests for Pokemon Endpoint

extension PokeAPINetworkServiceTests {
    func testCallPokeAPIServerWithPokemonEndpointExpectSuccessfulResponse() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(endpoint: .pokemon, id: 35)
        let mockResponse = Data(PokeAPIMocks.PokeAPIPokemonMock.utf8)
        
        MockURLProtocol.mockData = mockResponse
        MockURLProtocol.mockResponse = HTTPURLResponse(
            url: URL(string: "https://pokeapi.co/api/v2/pokemon/35")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        mockSession = URLSession(configuration: .ephemeral)
        pokeAPINetworkService = PokeAPINetworkService(session: mockSession, decoder: JSONDecoder())
        
        Task {
            do {
                let response = try await pokeAPINetworkService.callPokeAPIServer(with: request)
                
                XCTAssertEqual(response.id, 35)
                XCTAssertEqual(response.name, "clefairy")
                XCTAssertEqual(response.baseExperience, 113)
                XCTAssertEqual(response.moves[0].move.name, "pound")
                XCTAssertEqual(response.moves[0].versionGroupDetails[0].levelLearnedAt, 1)
                XCTAssertEqual(response.moves[0].versionGroupDetails[0].versionGroup.name, "red-blue")
                XCTAssertEqual(response.stats[0].baseStat, 35)
                XCTAssertEqual(response.stats[0].effort, 0)
                XCTAssertEqual(response.stats[0].stat.name, "speed")
                XCTAssertEqual(response.types[0].typeDetails.name, "fairy")
            } catch {
                XCTFail("Test failed where mockSession incorrectly returns the wrong data response")
            }
        }
    }
    
    func testCallPokeAPIServerWithPokemonEndpointAndCorruptedDataExpectErrorResponse() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(endpoint: .pokemon, id: 35)
        let mockResponse = Data(PokeAPIMocks.PokeAPIPokemonMockCorrupted.utf8)
        
        MockURLProtocol.mockData = mockResponse
        MockURLProtocol.mockResponse = HTTPURLResponse(
            url: URL(string: "https://pokeapi.co/api/v2/pokemon/35")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        mockSession = URLSession(configuration: .ephemeral)
        pokeAPINetworkService = PokeAPINetworkService(session: mockSession, decoder: JSONDecoder())
        
        Task {
            do {
                _ = try await pokeAPINetworkService.callPokeAPIServer(with: request)
            } catch let error as PokemonLeafGreenError {
                XCTAssertEqual(error.errorLogDescription, "Could not decode PokeAPIPokemonDetails object from JSON data object from pokeapi")
                XCTAssertEqual(error.clientDescription, "Server is down. Please refresh the app or download again.")
            }
        }
    }
}

// MARK: - PokeAPINetworkService Tests with Species Endpoint

extension PokeAPINetworkServiceTests {
    func testCallPokeAPIServerWithSpeciesEndpointExpectSuccessfulResponse() {
        let request = PokeAPIRequest<PokeAPIPokemonSpeciesDetails>(endpoint: .species, id: 1)
        let mockResponse = Data(PokeAPIMocks.PokeAPIPokemonSpeciesMock.utf8)
        
        MockURLProtocol.mockData = mockResponse
        MockURLProtocol.mockResponse = HTTPURLResponse(
            url: URL(string: "https://pokeapi.co/api/v2/species/1")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        mockSession = URLSession(configuration: .ephemeral)
        pokeAPINetworkService = PokeAPINetworkService(session: mockSession, decoder: JSONDecoder())
        
        Task {
            do {
                let response = try await pokeAPINetworkService.callPokeAPIServer(with: request)
                
                XCTAssertEqual(response.id, 1)
                XCTAssertEqual(response.name, "bulbasaur")
                XCTAssertEqual(response.growthRate.name, "medium-slow")
                XCTAssertEqual(response.evolutionChain.url, "https://pokeapi.co/api/v2/evolution-chain/1/")
                XCTAssertEqual(response.descriptionDetails[0].description, "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
                XCTAssertEqual(response.descriptionDetails[0].language.name, "en")
                XCTAssertEqual(response.descriptionDetails[0].version.name, "red")
            } catch {
                XCTFail("Test failed where mockSession incorrectly returns the wrong data response")
            }
        }
    }
    
    func testCallPokeAPIServerWithSpeciesEndpointAndCorruptedDataExpectErrorResponse() {
        let request = PokeAPIRequest<PokeAPIPokemonSpeciesDetails>(endpoint: .species, id: 1)
        let mockResponse = Data(PokeAPIMocks.PokeAPIPokemonSpeciesMockCorrupted.utf8)
        
        MockURLProtocol.mockData = mockResponse
        MockURLProtocol.mockResponse = HTTPURLResponse(
            url: URL(string: "https://pokeapi.co/api/v2/species/1")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        mockSession = URLSession(configuration: .ephemeral)
        pokeAPINetworkService = PokeAPINetworkService(session: mockSession, decoder: JSONDecoder())
        
        Task {
            do {
                _ = try await pokeAPINetworkService.callPokeAPIServer(with: request)
            } catch let error as PokemonLeafGreenError {
                XCTAssertEqual(error.errorLogDescription, "Could not decode PokeAPIPokemonSpeciesDetails object from JSON data object from pokeapi")
                XCTAssertEqual(error.clientDescription, "Server is down. Please refresh the app or download again.")
            }
        }
    }
}

// MARK: - PokeAPINetworkService Tests with Move Endpoint

extension PokeAPINetworkServiceTests {
    func testCallPokeAPIServerWithMoveEndpointExpectSuccessfulResponse() {
        let request = PokeAPIRequest<PokeAPIMoveDetails>(endpoint: .move, id: 1)
        let mockResponse = Data(PokeAPIMocks.PokeAPIMove.utf8)
        
        MockURLProtocol.mockData = mockResponse
        MockURLProtocol.mockResponse = HTTPURLResponse(
            url: URL(string: "https://pokeapi.co/api/v2/move/1")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        mockSession = URLSession(configuration: .ephemeral)
        pokeAPINetworkService = PokeAPINetworkService(session: mockSession, decoder: JSONDecoder())
        
        Task {
            do {
                let response = try await pokeAPINetworkService.callPokeAPIServer(with: request)
                
                XCTAssertEqual(response.id, 1)
                XCTAssertEqual(response.name, "pound")
                XCTAssertEqual(response.accuracy, 100)
                XCTAssertEqual(response.pp, 35)
                XCTAssertEqual(response.power, 40)
                XCTAssertEqual(response.moveType.name, "normal")
                XCTAssertEqual(response.moveDescription[0].description, "Pounds with fore­legs or tail.")
                XCTAssertEqual(response.moveDescription[0].language.name, "en")
                XCTAssertEqual(response.moveDescription[0].version.name, "gold-silver")
            } catch {
                XCTFail("Test failed where mockSession incorrectly returns the wrong data response")
            }
        }
    }
    
    func testCallPokeAPIServerWithMoveEndpointAndCorruptedDataExpectErrorResponse() {
        let request = PokeAPIRequest<PokeAPIMoveDetails>(endpoint: .move, id: 1)
        let mockResponse = Data(PokeAPIMocks.PokeAPIMoveCorrupted.utf8)
        
        MockURLProtocol.mockData = mockResponse
        MockURLProtocol.mockResponse = HTTPURLResponse(
            url: URL(string: "https://pokeapi.co/api/v2/move/1")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
        
        mockSession = URLSession(configuration: .ephemeral)
        pokeAPINetworkService = PokeAPINetworkService(session: mockSession, decoder: JSONDecoder())
        
        Task {
            do {
                _ = try await pokeAPINetworkService.callPokeAPIServer(with: request)
            } catch let error as PokemonLeafGreenError {
                XCTAssertEqual(error.errorLogDescription, "Could not decode PokeAPIMoveDetails object from JSON data object from pokeapi")
                XCTAssertEqual(error.clientDescription, "Server is down. Please refresh the app or download again.")
            }
        }
    }
}
