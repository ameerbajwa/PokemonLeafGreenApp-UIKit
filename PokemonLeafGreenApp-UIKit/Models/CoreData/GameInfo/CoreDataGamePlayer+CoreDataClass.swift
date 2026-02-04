//
//  CoreDataGamePlayer+CoreDataClass.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/1/25.
//
//

import Foundation
import CoreData

@objc(CoreDataGamePlayer)
public class CoreDataGamePlayer: NSManagedObject, CoreDataManageable {
    func adaptNewGame() {
        self.id = 1
        self.name = ""
        self.money = 0
        self.lastLocation = PokemonLocationIdNamePokemonConfiguration.palletTown.name
        
        if let playerPokemonCount = pokemon?.count,
            playerPokemonCount > 0, let pokemonSet = pokemon {
            self.removeFromPokemon(pokemonSet)
        }
    }
    
    func adaptRivalPlayer() {
        self.id = 2
        self.name = "Ash"
        self.money = 0
        self.lastLocation = ""
        
        if let playerPokemonCount = pokemon?.count,
            playerPokemonCount > 0, let pokemonSet = pokemon {
            self.removeFromPokemon(pokemonSet)
        }
    }
    
    func adaptPlayerName(playerName: String) {
        self.name = playerName
    }
}
