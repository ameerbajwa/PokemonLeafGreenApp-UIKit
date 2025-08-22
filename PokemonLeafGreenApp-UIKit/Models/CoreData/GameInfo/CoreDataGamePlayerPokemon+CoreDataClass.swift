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
    func adaptStarterPokemon(pokemonConfiguration: PokemonIdNameConfiguration) {
        self.id = Int16(pokemonConfiguration.id)
        self.name = pokemonConfiguration.name
        self.level = 5
        self.order = 1
        self.currentExperience = 141
    }
}
