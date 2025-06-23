//
//  CoreDataMove+CoreDataClass.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData

@objc(CoreDataMove)
public class CoreDataMove: NSManagedObject {
    func adapt(pokeAPIMoveModel: PokeAPIMoveDetails) {
        self.id = Int16(pokeAPIMoveModel.id)
        self.name = pokeAPIMoveModel.name
        self.accuracy = Int16(pokeAPIMoveModel.accuracy)
        self.pp = Int16(pokeAPIMoveModel.pp)
        self.power = Int16(pokeAPIMoveModel.power ?? 0)
        self.moveType = pokeAPIMoveModel.moveType.name
        
        let moveDescription = pokeAPIMoveModel.moveDescription.filter { moveDescriptionDetails in
            moveDescriptionDetails.version.name == "firered-leafgreen" &&
            moveDescriptionDetails.language.name == "en"
        }
        self.moveDescription = moveDescription[0].description
    }
}
