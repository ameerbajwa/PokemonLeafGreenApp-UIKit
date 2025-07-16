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
            throw PokemonLeafGreenError.coreDataSaveError(model: "\(CoreDataMove.self)")
        }
    }
    
    func saveCoreDataPokemonModel(pokeAPIPokemon: PokeAPIPokemonDetails, pokeAPIPokemonSpecies: PokeAPIPokemonSpeciesDetails) async throws {
        let adapter = PokeAPICoreDataAdapter(coreDataContext: context)
        _ = adapter.adaptPokemonToCoreData(pokeAPIPokemon: pokeAPIPokemon, pokeAPIPokemonSpecies: pokeAPIPokemonSpecies)
        
        do {
            try context.save()
        } catch {
            throw PokemonLeafGreenError.coreDataSaveError(model: "\(CoreDataPokemon.self)")
        }
    }
    
    func saveGamePlayerModel() throws {
        let coreDataGamePlayerModel = CoreDataGamePlayer(context: context)
        coreDataGamePlayerModel.adaptNewGame()
        
        do {
            try context.save()
        } catch {
            throw PokemonLeafGreenError.coreDataSaveError(model: "\(CoreDataGamePlayer.self)")
        }
    }
}

// MARK: - Fetching CoreData Models

extension CoreDataNetworkService {
    func fetchCoreDataModel<CoreDataRequest: CoreDataRequesting>(with request: CoreDataRequest) throws -> CoreDataRequest.Model {
        guard let fetchRequest = CoreDataRequest.Model.fetchRequest() as? NSFetchRequest<CoreDataRequest.Model> else {
            throw PokemonLeafGreenError.coreDataFetchRequestError(model: "\(CoreDataRequest.Model.self)")
        }
        
        if let safeIdentifierKey = request.identifierKey, let safeIdentifierValue = request.identifierValue {
            let fetchRequestPredicate = NSPredicate(format: "%K == %@", safeIdentifierKey, safeIdentifierValue)
            fetchRequest.predicate = fetchRequestPredicate
        }
        
        fetchRequest.fetchLimit = 1
                
        do {
            let coreDataModels = try context.fetch(fetchRequest)
            guard let coreDataModel = coreDataModels.first else {
                throw PokemonLeafGreenError.noRecordInCoreData(model: "\(CoreDataRequest.Model.self)",identifierValue: request.identifierValue, identifierKey: request.identifierKey)
            }
            return coreDataModel
        } catch let error as PokemonLeafGreenError {
            throw error
        } catch {
            throw PokemonLeafGreenError.coreDataFetchError(model: "\(CoreDataRequest.Model.self)", underlayingCoreDataError: error.localizedDescription)
        }
    }
}
