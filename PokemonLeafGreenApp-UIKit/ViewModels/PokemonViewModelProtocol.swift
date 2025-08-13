//
//  PokemonViewModelProtocol.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/10/25.
//

protocol PokemonNetworkCheckingAndStoring {
    var pokeAPINetworkService: PokeAPINetworkService { get }
    var coreDataNetworkService: CoreDataNetworkService { get }
    var pokemonLocationConfiguration: PokemonLocationConfiguration { get }
    
    func checkCoreDataPokemonObject(pokemonConfigurationList: [PokemonIdNameConfiguration]) async throws -> Bool
    func storePokemonInCoreData(pokemonConfiguration: PokemonIdNameConfiguration) async throws -> [PokeAPIPokemonMoveDetails]
    func checkCoreDataMoveObject(pokemonMove: PokeAPIPokemonMoveDetails) async throws -> Bool
    func storePokemonMoveInCoreData(pokemonMove: CoreDataPokemonMoveList) async
}

extension PokemonNetworkCheckingAndStoring {
    func checkCoreDataPokemonObject(pokemonConfiguration: PokemonIdNameConfiguration) async throws -> Bool {
        do {
            let coreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierValue: pokemonConfiguration.name)
            return try coreDataNetworkService.fetchCoreDataModelCount(with: coreDataFetchRequest)
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
        
    func checkCoreDataMoveObject(pokemonMove: CoreDataPokemonMoveList) async throws -> Bool {
        do {
            let coreDataFetchRequest = CoreDataRequest<CoreDataMove>(identifierKey: #keyPath(CoreDataMove.name), identifierValue: pokemonMove.name)
            return try coreDataNetworkService.fetchCoreDataModelCount(with: coreDataFetchRequest)
        } catch {
            throw error
        }
    }
    
    func storePokemonMoveInCoreData(pokemonMove: CoreDataPokemonMoveList) async {
        let pokemonMoveRequest = PokeAPIRequest<PokeAPIMoveDetails>(endpoint: .move, id: Int(pokemonMove.id))
        
        do {
            let pokemonMoveResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonMoveRequest)
            try await coreDataNetworkService.saveCoreDataMoveModel(pokeAPIMove: pokemonMoveResponse)
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
        } catch {
            print("Shit went wrong - \(error.localizedDescription)")
        }
    }
}
