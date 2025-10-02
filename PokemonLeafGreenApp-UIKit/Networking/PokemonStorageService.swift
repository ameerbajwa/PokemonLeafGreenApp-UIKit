//
//  PokemonStorageService.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/15/25.
//

protocol PokemonNetworkCheckingAndStoring: PokemonNetworking {}

extension PokemonNetworkCheckingAndStoring {
    func checkPokemonInCoreData(pokemonConfiguration: PokemonIdNameConfiguration) async throws -> Set<CoreDataPokemonMoveList>? {
        do {
            let coreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierStringValue: pokemonConfiguration.name)
            let doesCoreDataPokemonModelExist = try coreDataNetworkService.fetchCoreDataModelCount(with: coreDataFetchRequest)
            guard !doesCoreDataPokemonModelExist else {
                return nil
            }
            return try await storePokemonInCoreData(pokemonConfiguration: pokemonConfiguration)
        } catch {
            throw error
        }
    }
    
    func storePokemonInCoreData(pokemonConfiguration: PokemonIdNameConfiguration) async throws -> Set<CoreDataPokemonMoveList> {
        let pokemonRequest = PokeAPIRequest<PokeAPIPokemonDetails>(endpoint: .pokemon, id: pokemonConfiguration.id)
        let pokemonSpeciesRequest = PokeAPIRequest<PokeAPIPokemonSpeciesDetails>(endpoint: .species, id: pokemonConfiguration.id)
        
        do {
            let pokemonResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonRequest)
            let pokemonSpeciesResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonSpeciesRequest)
            let coreDataPokemonModel = try await coreDataNetworkService.saveCoreDataPokemonModel(pokeAPIPokemon: pokemonResponse, pokeAPIPokemonSpecies: pokemonSpeciesResponse)
            guard let coreDataMoveListModel = coreDataPokemonModel.moves as? Set<CoreDataPokemonMoveList> else {
                throw PokemonLeafGreenError.nsSetConversionError
            }
            return coreDataMoveListModel
        } catch {
            throw error
        }
    }
        
    func checkCoreDataMoveObject(pokemonMove: CoreDataPokemonMoveList) async throws {
        do {
            let coreDataFetchRequest = CoreDataRequest<CoreDataMove>(identifierKey: #keyPath(CoreDataMove.name), identifierStringValue: pokemonMove.name)
            let doesCoreDataMoveModelExist = try coreDataNetworkService.fetchCoreDataModelCount(with: coreDataFetchRequest)
            if !doesCoreDataMoveModelExist {
                try await storePokemonMoveInCoreData(pokemonMove: pokemonMove)
            }
        } catch {
            throw error
        }
    }
    
    func storePokemonMoveInCoreData(pokemonMove: CoreDataPokemonMoveList) async throws {
        let pokemonMoveRequest = PokeAPIRequest<PokeAPIMoveDetails>(endpoint: .move, id: Int(pokemonMove.id))
        
        do {
            let pokemonMoveResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonMoveRequest)
            try await coreDataNetworkService.saveCoreDataMoveModel(pokeAPIMove: pokemonMoveResponse)
        } catch {
            throw error
        }
    }
}

struct PokemonStorageService: PokemonNetworkCheckingAndStoring {
    var pokeAPINetworkService: PokeAPINetworkService
    var coreDataNetworkService: CoreDataNetworkService
    var pokemonLocationConfiguration: PokemonLocationConfiguration
    
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, pokemonLocationConfiguration: PokemonLocationConfiguration) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.pokemonLocationConfiguration = pokemonLocationConfiguration
    }
    
    func checkAndStorePokemonInfo() async throws {
        if let pokemonConfigurations = pokemonLocationConfiguration.pokemonConfigurations {
            for pokemonConfiguration in pokemonConfigurations {
                print(pokemonConfiguration.name)
                let pokemonMoves = try await checkPokemonInCoreData(pokemonConfiguration: pokemonConfiguration)
                if let moves = pokemonMoves {
                    for move in moves {
                        print(move.name)
                        try await checkCoreDataMoveObject(pokemonMove: move)
                    }
                }
            }
        }
    }
}
