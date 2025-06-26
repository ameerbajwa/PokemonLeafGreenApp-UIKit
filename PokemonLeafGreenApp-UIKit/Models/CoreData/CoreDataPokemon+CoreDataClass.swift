//
//  CoreDataPokemon+CoreDataClass.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/18/25.
//
//

import Foundation
import CoreData

@objc(CoreDataPokemon)
public class CoreDataPokemon: NSManagedObject {
    func adapt(pokeAPIPokemon: PokeAPIPokemonDetails, pokeAPIPokemonSpecies: PokeAPIPokemonSpeciesDetails) {
        self.id = Int16(pokeAPIPokemon.id)
        self.name = pokeAPIPokemon.name
        self.baseExperience = Int16(pokeAPIPokemon.baseExperience)
        self.growthRate = pokeAPIPokemonSpecies.growthRate.name
        self.type = pokeAPIPokemon.types[0].typeDetails.name
        self.type2 = (pokeAPIPokemon.types.count > 1 ? pokeAPIPokemon.types[1].typeDetails.name : nil)
        self.frontImageUrlString = pokeAPIPokemon.sprites.versions.generationIII.leafGreen.frontImageUrl
        self.backImageUrlString = pokeAPIPokemon.sprites.versions.generationIII.leafGreen.backImageUrl
        
        let pokemonDescription = pokeAPIPokemonSpecies.descriptionDetails.filter { speciesDescriptionDetails in
            speciesDescriptionDetails.language.name == CommonAppMessages.englishLanguage && speciesDescriptionDetails.version.name == CommonAppMessages.pokemonLeafGreenVersion
        }
        self.pokemonDescription = pokemonDescription[0].description
    }
}
