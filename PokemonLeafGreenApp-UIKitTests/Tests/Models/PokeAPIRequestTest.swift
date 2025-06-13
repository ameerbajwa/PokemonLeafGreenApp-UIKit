//
//  PokeAPIRequestTest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/12/25.
//

import Foundation
import XCTest
@testable import PokemonLeafGreenApp_UIKit

class PokeAPIRequestTest: XCTestCase {

    func testPokeAPIRequestForPokemonEndpointExpectCorrectUrl() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .pokemon, id: 1)
        
        do {
            let urlRequest = try request.createURLRequest()
            
            XCTAssertEqual(urlRequest.url?.absoluteString, "https://pokeapi.co/api/v2/pokemon/1")
        } catch {
            XCTFail("PokeAPIURLRequest url does not match accordingly")
        }
    }
    
    func testPokeAPIRequestForPokemonEndpointExpectGetMethod() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .pokemon, id: 1)
        
        do {
            let urlRequest = try request.createURLRequest()
            
            XCTAssertEqual(urlRequest.httpMethod, "GET")
        } catch {
            XCTFail("PokeAPIURLRequest url does not match accordingly")
        }
    }
    
    func testPokeAPIRequestForSpeciesEndpointExpectCorrectUrl() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .species, id: 1)
        
        do {
            let urlRequest = try request.createURLRequest()
            
            XCTAssertEqual(urlRequest.url?.absoluteString, "https://pokeapi.co/api/v2/pokemon-species/1")
        } catch {
            XCTFail("PokeAPIURLRequest url does not match accordingly")
        }
    }
    
    func testPokeAPIRequestForSpeciesEndpointExpectGetMethod() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .species, id: 1)
        
        do {
            let urlRequest = try request.createURLRequest()
            
            XCTAssertEqual(urlRequest.httpMethod, "GET")
        } catch {
            XCTFail("PokeAPIURLRequest url does not match accordingly")
        }
    }
    
    func testPokeAPIRequestForMoveEndpointExpectCorrectUrl() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .move, id: 1)
        
        do {
            let urlRequest = try request.createURLRequest()
            
            XCTAssertEqual(urlRequest.url?.absoluteString, "https://pokeapi.co/api/v2/move/1")
        } catch {
            XCTFail("PokeAPIURLRequest url does not match accordingly")
        }
    }
    
    func testPokeAPIRequestForMoveEndpointExpectGetMethod() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .pokemonBaseUrl, endpoint: .move, id: 1)
        
        do {
            let urlRequest = try request.createURLRequest()
            
            XCTAssertEqual(urlRequest.httpMethod, "GET")
        } catch {
            XCTFail("PokeAPIURLRequest url does not match accordingly")
        }
    }
    
    func testPokeAPIRequestForFrontImageEndpointExpectCorrectUrl() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .imageBaseUrl, endpoint: .frontImage, id: 1)
        
        do {
            let urlRequest = try request.createURLRequest()
            
            XCTAssertEqual(urlRequest.url?.absoluteString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/1.png")
        } catch {
            XCTFail("PokeAPIURLRequest url does not match accordingly")
        }
    }
    
    func testPokeAPIRequestForBackImageEndpointExpectCorrectUrl() {
        let request = PokeAPIRequest<PokeAPIPokemonDetails>(baseUrl: .imageBaseUrl, endpoint: .backImage, id: 1)
        
        do {
            let urlRequest = try request.createURLRequest()
            
            XCTAssertEqual(urlRequest.url?.absoluteString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/1.png")
        } catch {
            XCTFail("PokeAPIURLRequest url does not match accordingly")
        }
    }
}
