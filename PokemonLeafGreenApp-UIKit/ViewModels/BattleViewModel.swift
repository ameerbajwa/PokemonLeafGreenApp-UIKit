//
//  BattleViewModel.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 2/21/26.
//

import Foundation

class BattleViewModel: NSObject {
    var pokeAPINetworkService: PokeAPINetworkService
    var coreDataNetworkService: CoreDataNetworkService
    var pokemonFullInfoLoadingService: PokemonFullInfoLoading
    var playerPokemonSquadManager: PlayerPokemonSquadManager
    var opposingBattleConfiguration: PokemonBattleConfiguration
    
    var trainerPokemonSquadManager: TrainerPokemonSquadManager?
    var wildPokemonManager: WildPokemonManager?
    
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, pokemonFullInfoLoadingService: PokemonFullInfoLoading, playerPokemonSquadManager: PlayerPokemonSquadManager, opposingBattleConfiguration: PokemonBattleConfiguration) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        self.playerPokemonSquadManager = playerPokemonSquadManager
        self.opposingBattleConfiguration = opposingBattleConfiguration
        super.init()
        
        switch opposingBattleConfiguration {
        case .trainer(let pokemonTrainerConfiguration):
            self.trainerPokemonSquadManager = createTrainerPokemonSquadManager(opposingPokemonTrainerConfiguration: pokemonTrainerConfiguration)
        case .wildPokemon(let wildPokemonConfigurations):
            self.wildPokemonManager = createWildPokemonManager(wildPokemonConfigurations: wildPokemonConfigurations)
        }
    }
}

// MARK: - Initialize Opposing Pokemon
extension BattleViewModel {
    func createTrainerPokemonSquadManager(opposingPokemonTrainerConfiguration: PokemonTrainerConfiguration) -> TrainerPokemonSquadManager? {
        do {
            let opposingPokemonTrainerSquadManager = TrainerPokemonSquadManager(pokemonFullInfoLoadingService: self.pokemonFullInfoLoadingService, pokemonTrainerConfiguration: opposingPokemonTrainerConfiguration)
            try opposingPokemonTrainerSquadManager.fillStartingLineup()
            return opposingPokemonTrainerSquadManager
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
            print(error.clientDescription)
        } catch {
            print(error)
        }
        return nil
    }
    
    func createWildPokemonManager(wildPokemonConfigurations: [WildPokemonConfiguration]) -> WildPokemonManager? {
        do {
            let wildPokemonManager = WildPokemonManager(pokemonFullInfoLoadingService: self.pokemonFullInfoLoadingService, wildPokemonConfigurations: wildPokemonConfigurations)
            try wildPokemonManager.fillWildPokemonInfo()
            return wildPokemonManager
        } catch let error as PokemonLeafGreenError {
            print(error.errorLogDescription)
            print(error.clientDescription)
        } catch {
            print(error)
        }
        return nil
    }
}
