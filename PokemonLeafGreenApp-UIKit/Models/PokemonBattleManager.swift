//
//  PokemonBattleManager.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/25/25.
//

import Foundation

public class PokemonBattleManager {
    var pokemonFullInfoLoadingService: PokemonFullInfoLoading
    var pokemonLocationConfiguration: PokemonLocationConfiguration
    var playerPokemonFullBattleInfo: [PokemonFullInfo]?
    var trainerPokemonFullBattleInfo: [PokemonFullInfo]?
    var wildPokemonFullBattleInfo: PokemonFullInfo?
    
    init(pokemonFullInfoLoadingService: PokemonFullInfoLoading,
         pokemonLocationConfiguration: PokemonLocationConfiguration
    ) {
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        self.pokemonLocationConfiguration = pokemonLocationConfiguration
    }
}
