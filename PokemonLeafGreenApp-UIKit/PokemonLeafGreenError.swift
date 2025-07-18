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
    case coreDataSaveError(model: String)
    case coreDataFetchError(model: String, underlayingCoreDataError: String)
    case coreDataFetchRequestError(model: String)
    case noRecordInCoreData(model: String, identifierValue: String?, identifierKey: String?)
    
    var errorLogDescription: String {
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
        case .coreDataSaveError(let model):
            return "Could not save \(model) to Core Data"
        case .coreDataFetchError(let model, let errorMessage):
            return "Could not fetch \(model) from Core Data.\nCore Data Error - \(errorMessage)"
        case .coreDataFetchRequestError(let model):
            return "Failed to create an NSFetchRequest object from model \(model). Check CoreData model entity."
        case .noRecordInCoreData(let model, let identifier, let key):
            return "No record found in Core Data model \(model) for key-value pair - \(key ?? "id") - \(identifier ?? "1")"
        }
    }
    
    var clientDescription: String {
        switch self {
        case .stringToUrlConversionError(_), .urlReponseToHTTPUrlResponseError, .decodingError(_), .pokeAPIServerError(_, _), .coreDataSaveError(_), .coreDataFetchError(_, _), .coreDataFetchRequestError(_):
            return "Server is down. Please refresh the app or download again."
        case .noRecordInCoreData(_, _, _):
            return ""
        }
    }
}
