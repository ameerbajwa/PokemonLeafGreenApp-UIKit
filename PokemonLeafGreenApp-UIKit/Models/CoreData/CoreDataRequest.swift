//
//  CoreDataRequest.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/26/25.
//

import Foundation
import CoreData

protocol CoreDataRequesting {
    var identifierKey: String? { get set }
    var identifierValue: String? { get set }
    
    associatedtype Model: CoreDataManageable, NSManagedObject
}

public struct CoreDataRequest<CoreDataModel: CoreDataManageable & NSManagedObject>: CoreDataRequesting {
    var identifierKey: String?
    var identifierValue: String?
    
    typealias Model = CoreDataModel
    
    init(identifierKey: String? = nil, identifierValue: String? = nil) {
        self.identifierKey = identifierKey
        self.identifierValue = identifierValue
    }
}
