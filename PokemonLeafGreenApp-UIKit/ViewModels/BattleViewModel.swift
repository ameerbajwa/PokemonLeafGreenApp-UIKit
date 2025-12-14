//
//  BattleViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/22/25.
//

import Foundation
import UIKit
import Combine

class BattleViewModel {
    var configuration: PokemonBattleConfiguration
    var coreDataNetworkService: CoreDataNetworkService
    weak var controller: BattleViewController?
    
    var playerInfo: CoreDataGamePlayer?
    @Published var playerPokemon: [CoreDataGamePlayerPokemon] = []
    var playerSelectedPokemon: CoreDataGamePlayerPokemon?
    var playerPokemonMoveMasterList: [Int:[CoreDataMove]] = [:]
    var trainerPokemonMoveMasterList: [[CoreDataMove]] = []
    @Published var playerSelectedPokemonMoves: [CoreDataMove] = []
    @Published var battleText: String = ""
    
    init(configuration: PokemonBattleConfiguration, coreDataNetworkService: CoreDataNetworkService) {
        self.configuration = configuration
        self.coreDataNetworkService = coreDataNetworkService
        
        fetchPlayerInfo()
        fetchPlayerMasterMoveList()
    }
    
    func fetchPlayerInfo() {
        do {
            let coreDataFetchRequest = CoreDataRequest<CoreDataGamePlayer>(identifierKey: #keyPath(CoreDataGamePlayer.id), identifierIntValue: 1)
            playerInfo = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
            if let playerPokemonSet = playerInfo?.pokemon as? Set<CoreDataGamePlayerPokemon> {
                playerPokemon = playerPokemonSet.sorted(by: { firstPokemon, secondPokemon in
                    firstPokemon.order < secondPokemon.order
                })
                playerSelectedPokemon = playerPokemon[0]
            }
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
        } catch {
            print(error)
        }
    }
    
    func fetchPlayerMasterMoveList() {
        for (index, pokemon) in playerPokemon.enumerated() {
            playerPokemonMoveMasterList[index] = fetchMoveList(from: pokemon)
        }
    }
}

// MARK: - Fetching Move list for battling pokemon

extension BattleViewModel {
    func fetchMoveList(from selectedPokemon: CoreDataGamePlayerPokemon) -> [CoreDataMove]? {
        do {
            let coreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierStringValue: selectedPokemon.name)
            let coreDataPokemonModel = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
            if let playerSelectedPokemonMoveSet = coreDataPokemonModel.moves as? Set<CoreDataPokemonMoveList> {
                let playerSelectedPokemonMoveList = playerSelectedPokemonMoveSet
                    .sorted { firstMove, secondMove in
                        firstMove.levelLearnedAt < secondMove.levelLearnedAt
                    }.filter { moveList in
                        moveList.levelLearnedAt <= selectedPokemon.level
                    }
                var pokemonMoves: [CoreDataMove] = []
                for move in playerSelectedPokemonMoveList {
                    let coreDataFetchRequest = CoreDataRequest<CoreDataMove>(identifierKey: #keyPath(CoreDataMove.name), identifierStringValue: move.name)
                    let coreDataMoveModel = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
                    pokemonMoves.append(coreDataMoveModel)
                }
                return pokemonMoves
            }
            return nil
        } catch {
            print(error)
            return nil
        }
    }
    
    func fetchTrainerPokemonMoveList() {
        if let trainerPokemonList = configuration.trainer?.pokemon {
            for trainerPokemon in trainerPokemonList {
                do {
                    let coreDataFetchRequest = CoreDataRequest<CoreDataPokemon>(identifierKey: #keyPath(CoreDataPokemon.name), identifierStringValue: trainerPokemon.name)
                    let coreDataPokemonModel = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
                    if let playerSelectedPokemonMoveSet = coreDataPokemonModel.moves as? Set<CoreDataPokemonMoveList> {
                        let playerSelectedPokemonMoveList = playerSelectedPokemonMoveSet
                            .sorted { firstMove, secondMove in
                                firstMove.levelLearnedAt < secondMove.levelLearnedAt
                            }.filter { moveList in
                                moveList.levelLearnedAt <= trainerPokemon.level
                            }
                        var pokemonMoves: [CoreDataMove] = []
                        for move in playerSelectedPokemonMoveList {
                            let coreDataFetchRequest = CoreDataRequest<CoreDataMove>(identifierKey: #keyPath(CoreDataMove.name), identifierStringValue: move.name)
                            let coreDataMoveModel = try coreDataNetworkService.fetchCoreDataModel(with: coreDataFetchRequest)
                            pokemonMoves.append(coreDataMoveModel)
                        }
                        trainerPokemonMoveMasterList.append(pokemonMoves)
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}

// MARK: - Battle UI Delegate Methods

extension BattleViewModel {
    func dismissText() {
        
    }
    
    func displayMoveList() {
        
    }
    
    func displayPokemonList() {
        
    }
}
