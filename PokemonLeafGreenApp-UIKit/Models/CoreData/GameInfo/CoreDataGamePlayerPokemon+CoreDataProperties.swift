//
//  CoreDataGamePlayerPokemon+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/1/25.
//
//

import Foundation
import CoreData

extension CoreDataGamePlayerPokemon {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataGamePlayerPokemon> {
        return NSFetchRequest<CoreDataGamePlayerPokemon>(entityName: "CoreDataGamePlayerPokemon")
    }

    @NSManaged public var effortValueEarnedForAttack: Int16
    @NSManaged public var effortValueEarnedForDefense: Int16
    @NSManaged public var effortValueEarnedForHP: Int16
    @NSManaged public var effortValueEarnedForSpecialAttack: Int16
    @NSManaged public var effortValueEarnedForSpecialDefense: Int16
    @NSManaged public var effortValueEarnedForSpeed: Int16
    @NSManaged public var currentExperience: Int16
    @NSManaged public var id: Int16
    @NSManaged public var level: Int16
    @NSManaged public var name: String
    @NSManaged public var order: Int16
    @NSManaged public var player: CoreDataGamePlayer?
}
