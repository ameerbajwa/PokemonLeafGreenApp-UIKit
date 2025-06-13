//
//  PokemonLeafGreenError.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/11/25.
//

import Foundation

public enum PokemonLeafGreenError: Error {
    case stringToUrlConversionError(urlString: String)
    case urlReponseToHTTPUrlResponseError
    case decodingError(responseType: String)
    case pokeAPIServerError(statusCode: Int, errorDescription: String?)
    
    var debugDescription: String {
        switch self {
        case .stringToUrlConversionError(let urlString):
            return "Could not convert \(urlString) to URL object"
        case .urlReponseToHTTPUrlResponseError:
            return "Could not convert URLResponse object to HTTPURLResponse"
        case .decodingError(let responseType):
            return "Could not decode \(responseType) object from JSON data object from pokeapi"
        case .pokeAPIServerError(let statusCode, let errorDescription):
            if let safeErrorDescription = errorDescription {
                return "PokeAPI server error - \(statusCode)\nError description: \(safeErrorDescription)"
            } else {
                return "PokeAPI server error - \(statusCode)"
            }
        }
    }
    
    var errorLogDescription: String {
        switch self {
        case .stringToUrlConversionError(_), .urlReponseToHTTPUrlResponseError, .decodingError(_), .pokeAPIServerError(_, _):
            return "Server is down. Please refresh the app or download again."
        }
    }
}
