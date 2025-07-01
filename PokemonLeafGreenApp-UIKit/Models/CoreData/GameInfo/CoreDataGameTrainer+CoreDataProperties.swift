//
//  CoreDataGameTrainer+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/1/25.
//
//

import Foundation
import CoreData


extension CoreDataGameTrainer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataGameTrainer> {
        return NSFetchRequest<CoreDataGameTrainer>(entityName: "CoreDataGameTrainer")
    }

    @NSManaged public var order: Int16
    @NSManaged public var name: String?
    @NSManaged public var id: Int16

}

extension CoreDataGameTrainer : Identifiable {

}
