//
//  CoreDataMove+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData

extension CoreDataMove {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataMove> {
        return NSFetchRequest<CoreDataMove>(entityName: "CoreDataMove")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String
    @NSManaged public var accuracy: Int16
    @NSManaged public var pp: Int16
    @NSManaged public var power: Int16
    @NSManaged public var moveType: String
    @NSManaged public var moveDescription: String
    @NSManaged public var statChanges: NSSet?
}

// MARK: Generated accessors for statChanges
extension CoreDataMove {
    @objc(addStatChangesObject:)
    @NSManaged public func addToStatChanges(_ value: CoreDataMoveStatChange)

    @objc(removeStatChangesObject:)
    @NSManaged public func removeFromStatChanges(_ value: CoreDataMoveStatChange)

    @objc(addStatChanges:)
    @NSManaged public func addToStatChanges(_ values: NSSet)

    @objc(removeStatChanges:)
    @NSManaged public func removeFromStatChanges(_ values: NSSet)
}
