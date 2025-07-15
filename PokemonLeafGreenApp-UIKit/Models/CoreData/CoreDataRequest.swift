//
//  CoreDataRequest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/26/25.
//

import Foundation
import CoreData

protocol CoreDataRequesting {
    var identifierKey: String { get set }
    var identifierValue: String { get set }
    var identifier: CoreDataModelIdentifier { get set }
    
    associatedtype Model: CoreDataManageable, NSManagedObject
}

public enum CoreDataModelIdentifier {
    case idParameter
    case nameParameter
}

public struct CoreDataRequest<CoreDataModel: CoreDataManageable & NSManagedObject>: CoreDataRequesting {
    var identifierKey: String
    var identifierValue: String
    var identifier: CoreDataModelIdentifier
    
    typealias Model = CoreDataModel
    
    init(identifierKey: String, identifierValue: String) {
        self.identifierKey = identifierKey
        self.identifierValue = identifierValue
        
        self.identifier = (identifierKey == "id") ? .idParameter : .nameParameter
    }
    
    var identifierIdValue: Int16 {
        if identifierKey == "id" {
            return Int16(identifierValue) ?? 0
        }
        return 0
    }
}
