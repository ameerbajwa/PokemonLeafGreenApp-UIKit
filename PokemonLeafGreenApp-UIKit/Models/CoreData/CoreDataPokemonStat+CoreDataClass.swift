//
//  CoreDataPokemonStat+CoreDataClass.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData

@objc(CoreDataPokemonStat)
public class CoreDataPokemonStat: NSManagedObject {
    func adapt(pokeAPIStat: PokeAPIPokemonStatDetails) {
        self.name = pokeAPIStat.stat.name
        self.baseValue = Int16(pokeAPIStat.baseStat)
        self.effortValue = Int16(pokeAPIStat.effort)
        self.individualValue = Int16(individualValueRandomizer())
    }
    
    func individualValueRandomizer() -> Int {
        return Int.random(in: 1...31)
    }
}
