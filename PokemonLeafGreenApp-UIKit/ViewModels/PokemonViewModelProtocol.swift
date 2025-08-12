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
    
    func checkCoreDataPokemonObject(pokemonConfigurationList: [PokemonIdNameConfiguration]) async
    func storePokemonInCoreData() async
    func checkPokemonMovesInCoreData(pokemon: String) async
    func storePokemonMoveInCoreData(pokemonMove: CoreDataPokemonMoveList) async
}

extension PokemonNetworkCheckingAndStoring {
    func checkCoreDataPokemonObject(pokemonConfigurationList: [PokemonIdNameConfiguration]) async {
        for pokemon in pokemonConfigurationList {
            do {
                let coreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierValue: pokemon.name)
                _ = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
            } catch PokemonLeafGreenError.noRecordInCoreData(model: "\(CoreDataPokemon.self)", identifierValue: pokemon.name, identifierKey: #keyPath(CoreDataPokemon.name)) {
                await storePokemonInCoreData(pokemon: pokemon)
            } catch let error as PokemonLeafGreenError {
                print(error.errorLogDescription)
                print(error.clientDescription)
            } catch {
                print("Shit went wrong - \(error.localizedDescription)")
            }
        }
    }
    
    func storePokemonInCoreData(pokemon: PokemonIdNameConfiguration) async {
        let pokemonRequest = PokeAPIRequest<PokeAPIPokemonDetails>(endpoint: .pokemon, id: pokemon.id)
        let pokemonSpeciesRequest = PokeAPIRequest<PokeAPIPokemonSpeciesDetails>(endpoint: .species, id: pokemon.id)
        
        do {
            let pokemonResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonRequest)
            let pokemonSpeciesResponse = try await pokeAPINetworkService.callPokeAPIServer(with: pokemonSpeciesRequest)
            try await coreDataNetworkService.saveCoreDataPokemonModel(pokeAPIPokemon: pokemonResponse, pokeAPIPokemonSpecies: pokemonSpeciesResponse)
            await checkPokemonMovesInCoreData(pokemon: pokemon.name)
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
        } catch {
            print("Shit went wrong - \(error.localizedDescription)")
        }
    }
    
    func checkPokemonMovesInCoreData(pokemon: String) async {
        do {
            let coreDataPokemonFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierValue: pokemon)
            let coreDataPokemonModel = try coreDataNetworkService.fetchCoreDataModel(with: coreDataPokemonFetchRequest)
            
            if let moves = coreDataPokemonModel.moves as? Set<CoreDataPokemonMoveList> {
                for move in moves {
                    let coreDataPokemonMoveFetchRequest = CoreDataRequest<CoreDataMove>(identifierKey: #keyPath(CoreDataMove.name), identifierValue: move.name)
                    do {
                        _ = try coreDataNetworkService.fetchCoreDataModel(with: coreDataPokemonMoveFetchRequest)
                    } catch PokemonLeafGreenError.noRecordInCoreData(model: "\(CoreDataMove.self)", identifierValue: coreDataPokemonMoveFetchRequest.identifierValue, identifierKey: coreDataPokemonMoveFetchRequest.identifierKey) {
                        await storePokemonMoveInCoreData(pokemonMove: move)
                    } catch let error as PokemonLeafGreenError {
                        print(error.errorLogDescription)
                    } catch {
                        print("Shit went wrong - \(error.localizedDescription)")
                    }
                }
            }
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
        } catch {
            print("Shit went wrong - \(error.localizedDescription)")
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
