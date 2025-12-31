//
//  CoreDataRequest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/26/25.
//

import Foundation
import CoreData

protocol CoreDataRequesting {
    var requestType: CoreDataRequestType { get set }
    var identifierKey: String? { get set }
    var identifierStringValue: String? { get set }
    var identifierIntValue: Int? { get set }
    
    associatedtype Model: CoreDataManageable, NSManagedObject
}

public enum CoreDataRequestType {
    case fetchAllPlayerPokemon
    case fetchPlayerPokemonLineup
    case fetchPlayerPokemonPokedex
    case fetchModel
}

public struct CoreDataRequest<CoreDataModel: CoreDataManageable & NSManagedObject>: CoreDataRequesting {
    var requestType: CoreDataRequestType
    var identifierKey: String?
    var identifierStringValue: String?
    var identifierIntValue: Int?
    
    typealias Model = CoreDataModel
    
    init(requestType: CoreDataRequestType, identifierKey: String? = nil, identifierStringValue: String? = nil, identifierIntValue: Int? = nil) {
        self.requestType = requestType
        self.identifierKey = identifierKey
        self.identifierStringValue = identifierStringValue
        self.identifierIntValue = identifierIntValue
    }
}
