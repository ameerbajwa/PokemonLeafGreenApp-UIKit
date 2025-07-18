//
//  CoreDataGamePlayerPokemon+CoreDataClass.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/1/25.
//
//

import Foundation
import CoreData

@objc(CoreDataGamePlayerPokemon)
public class CoreDataGamePlayerPokemon: NSManagedObject {
    func adaptStarterPokemon(pokemon: String) {
        self.name = pokemon
        self.level = 5
        self.order = 1
        self.currentExperience = 141
    }
}
