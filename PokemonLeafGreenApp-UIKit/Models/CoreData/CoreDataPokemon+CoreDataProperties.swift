//
//  CoreDataPokemon+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData


extension CoreDataPokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataPokemon> {
        return NSFetchRequest<CoreDataPokemon>(entityName: "CoreDataPokemon")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var baseExperience: Int16
    @NSManaged public var growthRate: String?
    @NSManaged public var pokemonDescription: String?
    @NSManaged public var frontImageUrlString: String?
    @NSManaged public var backImageUrlString: String?
    @NSManaged public var type: String?
    @NSManaged public var type2: String?
    @NSManaged public var stats: NSSet?
    @NSManaged public var moves: NSSet?

}

// MARK: Generated accessors for stats
extension CoreDataPokemon {

    @objc(addStatsObject:)
    @NSManaged public func addToStats(_ value: CoreDataPokemonStat)

    @objc(removeStatsObject:)
    @NSManaged public func removeFromStats(_ value: CoreDataPokemonStat)

    @objc(addStats:)
    @NSManaged public func addToStats(_ values: NSSet)

    @objc(removeStats:)
    @NSManaged public func removeFromStats(_ values: NSSet)

}

// MARK: Generated accessors for moves
extension CoreDataPokemon {

    @objc(addMovesObject:)
    @NSManaged public func addToMoves(_ value: CoreDataPokemonMoveList)

    @objc(removeMovesObject:)
    @NSManaged public func removeFromMoves(_ value: CoreDataPokemonMoveList)

    @objc(addMoves:)
    @NSManaged public func addToMoves(_ values: NSSet)

    @objc(removeMoves:)
    @NSManaged public func removeFromMoves(_ values: NSSet)

}

extension CoreDataPokemon : Identifiable {

}
