//
//  CoreDataMoveStatChange+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData


extension CoreDataMoveStatChange {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataMoveStatChange> {
        return NSFetchRequest<CoreDataMoveStatChange>(entityName: "CoreDataMoveStatChange")
    }

    @NSManaged public var change: Int16
    @NSManaged public var statName: String?
    @NSManaged public var move: CoreDataMove?

}

extension CoreDataMoveStatChange : Identifiable {

}
