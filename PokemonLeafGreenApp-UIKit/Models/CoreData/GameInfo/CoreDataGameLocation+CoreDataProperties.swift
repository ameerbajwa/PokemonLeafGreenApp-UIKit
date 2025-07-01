//
//  CoreDataGameLocation+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/1/25.
//
//

import Foundation
import CoreData


extension CoreDataGameLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataGameLocation> {
        return NSFetchRequest<CoreDataGameLocation>(entityName: "CoreDataGameLocation")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var wildPokemon: NSSet?

}

// MARK: Generated accessors for wildPokemon
extension CoreDataGameLocation {

    @objc(addWildPokemonObject:)
    @NSManaged public func addToWildPokemon(_ value: CoreDataGameWildPokemon)

    @objc(removeWildPokemonObject:)
    @NSManaged public func removeFromWildPokemon(_ value: CoreDataGameWildPokemon)

    @objc(addWildPokemon:)
    @NSManaged public func addToWildPokemon(_ values: NSSet)

    @objc(removeWildPokemon:)
    @NSManaged public func removeFromWildPokemon(_ values: NSSet)

}

extension CoreDataGameLocation : Identifiable {

}
