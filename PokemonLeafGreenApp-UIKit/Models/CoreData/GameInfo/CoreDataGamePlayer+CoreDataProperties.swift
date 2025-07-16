//
//  CoreDataGamePlayer+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/1/25.
//
//

import Foundation
import CoreData


extension CoreDataGamePlayer {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataGamePlayer> {
        return NSFetchRequest<CoreDataGamePlayer>(entityName: "CoreDataGamePlayer")
    }

    @NSManaged public var id: Int16
    @NSManaged public var money: Int16
    @NSManaged public var name: String
    @NSManaged public var lastLocation: String
    @NSManaged public var pokemon: NSSet?
}

// MARK: Generated accessors for pokemon

extension CoreDataGamePlayer {
    @objc(addPokemonObject:)
    @NSManaged public func addToPokemon(_ value: CoreDataGamePlayerPokemon)

    @objc(removePokemonObject:)
    @NSManaged public func removeFromPokemon(_ value: CoreDataGamePlayerPokemon)

    @objc(addPokemon:)
    @NSManaged public func addToPokemon(_ values: NSSet)

    @objc(removePokemon:)
    @NSManaged public func removeFromPokemon(_ values: NSSet)
}
