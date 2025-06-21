//
//  CoreDataPokemonMoveList+CoreDataClass.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData

@objc(CoreDataPokemonMoveList)
public class CoreDataPokemonMoveList: NSManagedObject {
    func adaptPokeAPIMoveListToCoreDataPokemonMoveList(pokeAPIPokemonMoveDetails: PokeAPIPokemonMoveDetails) {
        let moveId = pokeAPIPokemonMoveDetails.move.url.split(separator: "/").last ?? ""
        let moveIdString = String(moveId)
        let moveIdInt = Int(moveIdString) ?? 0
        self.id = Int16(moveIdInt)
        
        self.name = pokeAPIPokemonMoveDetails.move.name
        
        let levelLearnedMoveAt = pokeAPIPokemonMoveDetails.versionGroupDetails.first?.levelLearnedAt ?? 0
        self.levelLearnedAt = Int16(levelLearnedMoveAt)
    }
}
