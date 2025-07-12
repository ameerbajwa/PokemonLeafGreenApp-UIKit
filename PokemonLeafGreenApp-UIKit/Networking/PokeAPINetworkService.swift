//
//  PokeAPINetworkService.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/11/25.
//

import Foundation

public class PokeAPINetworkService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession, decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }
    
    func callPokeAPIServer<PokeAPIRequest: PokeAPIBaseRequest>(with request: PokeAPIRequest) async throws -> PokeAPIRequest.ResponseType {
        let pokeAPIURLRequest = try request.createURLRequest()
        
        let (pokeAPIData, pokeAPIResponse) = try await session.data(for: pokeAPIURLRequest)
        guard let pokeAPIHTTPResponse = pokeAPIResponse as? HTTPURLResponse else {
            print(PokemonLeafGreenError.urlReponseToHTTPUrlResponseError.errorLogDescription)
            throw PokemonLeafGreenError.urlReponseToHTTPUrlResponseError
        }
        
        guard (200...299).contains(pokeAPIHTTPResponse.statusCode) else {
            print(PokemonLeafGreenError.pokeAPIServerError(statusCode: pokeAPIHTTPResponse.statusCode, errorDescription: String(data: pokeAPIData, encoding: .utf8)).errorLogDescription)
            throw PokemonLeafGreenError.pokeAPIServerError(statusCode: pokeAPIHTTPResponse.statusCode, errorDescription: String(data: pokeAPIData, encoding: .utf8))
        }
        
        do {
            let pokeAPIResponse = try decoder.decode(PokeAPIRequest.ResponseType.self, from: pokeAPIData)
            return pokeAPIResponse
        } catch {
            print(PokemonLeafGreenError.decodingError(responseType: "\(PokeAPIRequest.ResponseType.self)").errorLogDescription)
            throw PokemonLeafGreenError.decodingError(responseType: "\(PokeAPIRequest.ResponseType.self)")
        }
    }
    
    func retrievePokeAPIImageData(with request: PokeAPIImageBaseRequest) async throws -> Data {
        let pokeAPIURL = try request.createURL()
        
        let (pokeAPIData, pokeAPIResponse) = try await session.data(from: pokeAPIURL)
        guard let pokeAPIHTTPResponse = pokeAPIResponse as? HTTPURLResponse else {
            print(PokemonLeafGreenError.urlReponseToHTTPUrlResponseError.errorLogDescription)
            throw PokemonLeafGreenError.urlReponseToHTTPUrlResponseError
        }
        
        guard (200...299).contains(pokeAPIHTTPResponse.statusCode) else {
            print(PokemonLeafGreenError.pokeAPIServerError(statusCode: pokeAPIHTTPResponse.statusCode, errorDescription: String(data: pokeAPIData, encoding: .utf8)).errorLogDescription)
            throw PokemonLeafGreenError.pokeAPIServerError(statusCode: pokeAPIHTTPResponse.statusCode, errorDescription: String(data: pokeAPIData, encoding: .utf8))
        }
        
        return pokeAPIData
    }
}
