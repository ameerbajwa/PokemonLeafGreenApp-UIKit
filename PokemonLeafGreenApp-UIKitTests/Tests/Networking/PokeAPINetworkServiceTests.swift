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
    
    func testCallPokeAPIServerWithPokemonEndpointExpectSuccessfulResponse() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .pokemon, id: 35)
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
}
