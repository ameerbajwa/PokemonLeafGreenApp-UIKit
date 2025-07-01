//
//  CoreDataGameTrainerPokemon+CoreDataProperties.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/1/25.
//
//

import Foundation
import CoreData


extension CoreDataGameTrainerPokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataGameTrainerPokemon> {
        return NSFetchRequest<CoreDataGameTrainerPokemon>(entityName: "CoreDataGameTrainerPokemon")
    }

    @NSManaged public var order: Int16
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var level: Int16

}

extension CoreDataGameTrainerPokemon : Identifiable {

}
