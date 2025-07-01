//
//  CoreDataGameWildPokemon+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/1/25.
//
//

import Foundation
import CoreData


extension CoreDataGameWildPokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataGameWildPokemon> {
        return NSFetchRequest<CoreDataGameWildPokemon>(entityName: "CoreDataGameWildPokemon")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var lowestLevel: Int16
    @NSManaged public var highestLevel: Int16
    @NSManaged public var rate: Int16
    @NSManaged public var location: CoreDataGameLocation?

}

extension CoreDataGameWildPokemon : Identifiable {

}
