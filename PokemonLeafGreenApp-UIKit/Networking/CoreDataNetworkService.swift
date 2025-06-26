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
    func saveCoreDataMoveModel(pokeAPIMove: PokeAPIMoveDetails) async throws {
        let adapter = PokeAPICoreDataAdapter(coreDataContext: context)
        _ = adapter.adaptMoveToCoreData(pokeAPIMove: pokeAPIMove)
        
        do {
            try context.save()
        } catch {
            throw PokemonLeafGreenError.coreDataSaveError
        }
    }
    
    func saveCoreDataPokemonModel(pokeAPIPokemon: PokeAPIPokemonDetails, pokeAPIPokemonSpecies: PokeAPIPokemonSpeciesDetails) async throws {
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
    func fetchCoreDataModel<CoreDataRequest: CoreDataRequesting>(with request: CoreDataRequest) throws -> CoreDataRequest.Model {
        guard let fetchRequest = CoreDataRequest.Model.fetchRequest() as? NSFetchRequest<CoreDataRequest.Model> else {
            print("Failed to cast fetchRequest for model: \(CoreDataRequest.Model.self)")
            throw PokemonLeafGreenError.coreDataFetchError
        }
        let fetchRequestPredicate = NSPredicate(format: "%K == %@", request.identifierKey, request.identifier)
        fetchRequest.predicate = fetchRequestPredicate
        
        do {
            guard let coreDataModel = try context.fetch(fetchRequest).first else {
                throw PokemonLeafGreenError.coreDataFetchError
            }
            return coreDataModel
        } catch {
            throw PokemonLeafGreenError.coreDataFetchError
        }
    }
}
