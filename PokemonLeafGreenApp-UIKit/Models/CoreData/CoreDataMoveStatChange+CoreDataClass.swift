//
//  CoreDataMoveStatChange+CoreDataClass.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData

@objc(CoreDataMoveStatChange)
public class CoreDataMoveStatChange: NSManagedObject {
    func adapt(pokeAPIMoveStatChange: PokeAPIMoveStatChangeDetails) {
        self.change = Int16(pokeAPIMoveStatChange.change)
        self.statName = pokeAPIMoveStatChange.stat.name
    }
}
