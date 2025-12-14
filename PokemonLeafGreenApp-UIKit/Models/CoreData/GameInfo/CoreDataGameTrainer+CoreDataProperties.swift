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
    @NSManaged public var name: String
    @NSManaged public var id: Int16
    @NSManaged public var reward: Int16
    @NSManaged public var isGymLeader: Bool
    @NSManaged public var pokemon: NSSet?
    @NSManaged public var location: CoreDataGameLocation?
}

// MARK: Generated accessors for pokemon
extension CoreDataGameTrainer {
    @objc(addPokemonObject:)
    @NSManaged public func addToPokemon(_ value: CoreDataGameTrainerPokemon)

    @objc(removePokemonObject:)
    @NSManaged public func removeFromPokemon(_ value: CoreDataGameTrainerPokemon)

    @objc(addPokemon:)
    @NSManaged public func addToPokemon(_ values: NSSet)

    @objc(removePokemon:)
    @NSManaged public func removeFromPokemon(_ values: NSSet)
}
