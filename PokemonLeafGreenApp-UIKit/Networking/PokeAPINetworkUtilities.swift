//
//  PokeAPINetworkUtilities.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/11/25.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public enum PokeAPIBaseURL {
    case pokemonBaseUrl
    case imageBaseUrl
    
    var stringValue: String {
        switch self {
        case .pokemonBaseUrl:
            return "https://pokeapi.co/api/v2"
        case .imageBaseUrl:
            return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon"
        }
    }
}

public enum PokeAPIEndpoints {
    case pokemon
    case species
    case move
    case frontImage
    case backImage
    
    var stringValue: String {
        switch self {
        case .pokemon:
            return "/pokemon"
        case .species:
            return "/pokemon-species"
        case .move:
            return "/move"
        case .frontImage:
            return "/versions/generation-iii/firered-leafgreen"
        case .backImage:
            return "/versions/generation-iii/firered-leafgreen/back"
        }
    }
}
