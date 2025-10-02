//
//  PokemonBattleService.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/15/25.
//

protocol PokemonBattleInfoServicing: PokemonNetworking {
    var adapter: PokemonBattleReadyAdapter { get set }
    var manager: PokemonBattleManager { get set }
}

extension PokemonBattleInfoServicing {
    func fetchPlayerPokemon() throws -> [CoreDataGamePlayerPokemon] {
        do {
            let coreDataFetchRequest = CoreDataRequest<CoreDataGamePlayer>(identifierKey: #keyPath(CoreDataGamePlayer.id), identifierIntValue: 1)
            let playerInfo = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
            if let playerPokemonSet = playerInfo.pokemon as? Set<CoreDataGamePlayerPokemon> {
                return playerPokemonSet.sorted(by: { firstPokemon, secondPokemon in
                    firstPokemon.order < secondPokemon.order
                })
            } else {
                throw PokemonLeafGreenError.noPokemonStoredForPlayer
            }
        } catch {
            throw error
        }
    }
    
    func fetchPokemonModels(pokemonName: String, pokemonLevel: Int) throws -> (CoreDataPokemon, [CoreDataMove]) {
        do {
            let coreDataPokemonFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierStringValue: pokemonName)
            let coreDataPokemonModel = try coreDataNetworkService.fetchCoreDataModel(with: coreDataPokemonFetchRequest)
            if let playerSelectedPokemonMoveSet = coreDataPokemonModel.moves as? Set<CoreDataPokemonMoveList> {
                let playerSelectedPokemonMoveList = playerSelectedPokemonMoveSet
                    .sorted { firstMove, secondMove in
                        firstMove.levelLearnedAt < secondMove.levelLearnedAt
                    }.filter { moveList in
                        moveList.levelLearnedAt <= pokemonLevel
                    }
                var pokemonMoves: [CoreDataMove] = []
                for move in playerSelectedPokemonMoveList {
                    let coreDataMoveFetchRequest = CoreDataRequest<CoreDataMove>(identifierKey: #keyPath(CoreDataMove.name), identifierStringValue: move.name)
                    let coreDataMoveModel = try coreDataNetworkService.fetchCoreDataModel(with: coreDataMoveFetchRequest)
                    pokemonMoves.append(coreDataMoveModel)
                }
                return (coreDataPokemonModel, pokemonMoves)
            } else {
                throw PokemonLeafGreenError.noMovesStoredForPokemon
            }
        } catch {
            throw error
        }
    }
    
    func fetchPlayerPokemonFullBattleInfo(playerPokemon: CoreDataGamePlayerPokemon) throws -> PokemonFullBattleInfo {
        do {
            let (pokemonModel, pokemonMoveModels) = try fetchPokemonModels(pokemonName: playerPokemon.name, pokemonLevel: Int(playerPokemon.level))
            return adapter.adaptPlayerPokemonToPokemonFullBattleInfo(coreDataGamePlayerPokemonModel: playerPokemon, coreDataPokemonModel: pokemonModel, coreDataMoveModels: pokemonMoveModels)
        } catch {
            throw error
        }
    }
    
    func fetchWildPokemonFullBattleInfo(wildPokemon: WildPokemonConfiguration) throws -> PokemonFullBattleInfo {
        do {
            let wildPokemonLevel = Int.random(in: wildPokemon.lowestLevel...wildPokemon.highestLevel)
            let (wildPokemonModel, wildPokemonMoveModels) = try fetchPokemonModels(pokemonName: wildPokemon.name, pokemonLevel: wildPokemonLevel)
            
        } catch {
            throw error
        }
    }
}

struct PokemonBattleService {
    
}
