//
//  MockPersistentContainer.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/23/25.
//

import Foundation
import CoreData

struct MockPersistentContainer {
    static func makeInMemoryPersistentContainer() -> NSPersistentContainer {
        let container = NSPersistentContainer(name: "PokemonLeafGreenApp_UIKit")
        
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("In-memory store creation failed: \(error)")
            }
        }
        
        return container
    }
}

