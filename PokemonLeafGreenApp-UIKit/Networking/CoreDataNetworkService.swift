//
//  CoreDataNetworkService.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/25/25.
//

import Foundation
import CoreData

public struct CoreDataNetworkService {
    let context: NSManagedObjectContext
    
    init(container: NSPersistentContainer) {
        self.context = container.viewContext
    }
}

// MARK: - Adapting PokeAPI models to CoreData Models and saving them

extension CoreDataNetworkService {
    func saveCoreDataMoveModel(pokeAPIMove: PokeAPIMoveDetails) throws {
        let adapter = PokeAPICoreDataAdapter(coreDataContext: context)
        _ = adapter.adaptMoveToCoreData(pokeAPIMove: pokeAPIMove)
        
        do {
            try context.save()
        } catch {
            throw PokemonLeafGreenError.coreDataSaveError
        }
    }
    
    func saveCoreDataPokemonModel(pokeAPIPokemon: PokeAPIPokemonDetails, pokeAPIPokemonSpecies: PokeAPIPokemonSpeciesDetails) throws {
        let adapter = PokeAPICoreDataAdapter(coreDataContext: context)
        _ = adapter.adaptPokemonToCoreData(pokeAPIPokemon: pokeAPIPokemon, pokeAPIPokemonSpecies: pokeAPIPokemonSpecies)
        
        do {
            try context.save()
        } catch {
            throw PokemonLeafGreenError.coreDataSaveError
        }
    }
}

// MARK: - Fetching CoreData Models

extension CoreDataNetworkService {
    func fetchCoreDataPokemonDetails(pokemonName: String) throws -> CoreDataPokemon? {
        let coreDataPokemonDetailsRequest: NSFetchRequest<CoreDataPokemon> = CoreDataPokemon.fetchRequest()
        let pokemonPredicate = NSPredicate(format: "%K == %@", #keyPath(CoreDataPokemon.name), pokemonName)
        coreDataPokemonDetailsRequest.predicate = pokemonPredicate
        
        do {
            return try context.fetch(coreDataPokemonDetailsRequest).first
        } catch {
            throw PokemonLeafGreenError.coreDataFetchError
        }
    }
    
    func fetchCoreDataMoveDetails(moveName: String) throws -> CoreDataMove? {
        let coreDataMoveDetailsRequest: NSFetchRequest<CoreDataMove> = CoreDataMove.fetchRequest()
        let movePredicate = NSPredicate(format: "%K == %@", #keyPath(CoreDataMove.name), moveName)
        coreDataMoveDetailsRequest.predicate = movePredicate
        
        do {
            return try context.fetch(coreDataMoveDetailsRequest).first
        } catch {
            throw PokemonLeafGreenError.coreDataFetchError
        }
    }
}
