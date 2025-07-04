//
//  PokeAPIImageRequest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/3/25.
//

import Foundation

protocol PokeAPIImageBaseRequest {
    var baseUrl: PokeAPIBaseURL { get set }
    var endpoint: PokeAPIEndpoints { get set }
    var id: Int { get set }
            
    func createURL() throws -> URL
}

public struct PokeAPIImageRequest: PokeAPIImageBaseRequest {
    var baseUrl: PokeAPIBaseURL
    var endpoint: PokeAPIEndpoints
    var id: Int
            
    init(baseUrl: PokeAPIBaseURL, endpoint: PokeAPIEndpoints, id: Int) {
        self.baseUrl = baseUrl
        self.endpoint = endpoint
        self.id = id
    }
    
    func createURL() throws -> URL {
        let pokeAPIURLString = baseUrl.stringValue + endpoint.stringValue + "/\(id).png"
        
        guard let pokeAPIURL = URL(string: pokeAPIURLString) else {
            throw PokemonLeafGreenError.stringToUrlConversionError(urlString: pokeAPIURLString)
        }
        
        return pokeAPIURL
    }
}
