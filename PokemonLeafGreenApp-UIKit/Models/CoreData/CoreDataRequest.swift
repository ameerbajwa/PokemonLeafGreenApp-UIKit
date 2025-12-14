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
    var identifierStringValue: String? { get set }
    var identifierIntValue: Int? { get set }
    
    associatedtype Model: CoreDataManageable, NSManagedObject
}

public struct CoreDataRequest<CoreDataModel: CoreDataManageable & NSManagedObject>: CoreDataRequesting {
    var identifierKey: String
    var identifierStringValue: String?
    var identifierIntValue: Int?
    
    typealias Model = CoreDataModel
    
    init(identifierKey: String, identifierStringValue: String? = nil, identifierIntValue: Int? = nil) {
        self.identifierKey = identifierKey
        self.identifierStringValue = identifierStringValue
        self.identifierIntValue = identifierIntValue
    }
}
