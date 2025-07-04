//
//  PokeAPIRequest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/11/25.
//

import Foundation

protocol PokeAPIBaseRequest {
    var baseUrl: PokeAPIBaseURL { get set }
    var endpoint: PokeAPIEndpoints { get set }
    var id: Int? { get set }
    
    associatedtype ResponseType: PokeAPIBaseStructure
        
    func createURLRequest() throws -> URLRequest
}

public struct PokeAPIRequest<PokeAPIResponse: PokeAPIBaseStructure>: PokeAPIBaseRequest {
    var baseUrl: PokeAPIBaseURL
    var endpoint: PokeAPIEndpoints
    var id: Int?
    
    typealias ResponseType = PokeAPIResponse
        
    init(baseUrl: PokeAPIBaseURL, endpoint: PokeAPIEndpoints, id: Int? = nil) {
        self.baseUrl = baseUrl
        self.endpoint = endpoint
        self.id = id
    }
    
    func createURLRequest() throws -> URLRequest {
        var pokeAPIUrlString: String
        if let safeId = id  {
            pokeAPIUrlString = baseUrl.stringValue + endpoint.stringValue + "/\(safeId)"
        } else {
            pokeAPIUrlString = baseUrl.stringValue + endpoint.stringValue
        }
        
        guard let pokeAPIUrl = URL(string: pokeAPIUrlString) else {
            throw PokemonLeafGreenError.stringToUrlConversionError(urlString: pokeAPIUrlString)
        }
        
        var urlRequest = URLRequest(url: pokeAPIUrl)
        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        
        return urlRequest
    }
}
