//
//  CoreDataPokemonMoveList+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData


extension CoreDataPokemonMoveList {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataPokemonMoveList> {
        return NSFetchRequest<CoreDataPokemonMoveList>(entityName: "CoreDataPokemonMoveList")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String
    @NSManaged public var levelLearnedAt: Int16
    @NSManaged public var pokemon: CoreDataPokemon?
}
