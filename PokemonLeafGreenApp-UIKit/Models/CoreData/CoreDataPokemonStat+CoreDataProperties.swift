//
//  CoreDataPokemonStat+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData


extension CoreDataPokemonStat {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataPokemonStat> {
        return NSFetchRequest<CoreDataPokemonStat>(entityName: "CoreDataPokemonStat")
    }

    @NSManaged public var name: String
    @NSManaged public var baseValue: Int16
    @NSManaged public var individualValue: Int16
    @NSManaged public var effortValue: Int16
    @NSManaged public var pokemon: CoreDataPokemon?
}
