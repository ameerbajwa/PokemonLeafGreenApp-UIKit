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
    
    init(pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, pokemonFullInfoLoadingService: PokemonFullInfoLoading, playerPokemonSquadManager: PlayerPokemonSquadManager, opposingBattleConfiguration: PokemonBattleConfiguration) {
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        self.playerPokemonSquadManager = playerPokemonSquadManager
        self.opposingBattleConfiguration = opposingBattleConfiguration
    }
}
