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
    var identifier: String { get set }
    
    associatedtype Model: CoreDataPokemonManageable, NSManagedObject
}

public struct CoreDataRequest<CoreDataModel: CoreDataPokemonManageable & NSManagedObject>: CoreDataRequesting {
    var identifierKey: String
    var identifier: String
    
    typealias Model = CoreDataModel
    
    init(identifierKey: String, identifier: String) {
        self.identifierKey = identifierKey
        self.identifier = identifier
    }
}
