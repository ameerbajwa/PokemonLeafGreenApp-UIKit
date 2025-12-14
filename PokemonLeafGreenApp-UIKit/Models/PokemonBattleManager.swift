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
    var trainerPokemonFullBattleInfo: [PokemonFullInfo]?
    var wildPokemonFullBattleInfo: PokemonFullInfo?
    
    init(pokemonFullInfoLoadingService: PokemonFullInfoLoading,
         pokemonLocationConfiguration: PokemonLocationConfiguration
    ) {
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        self.pokemonLocationConfiguration = pokemonLocationConfiguration
    }
    
    func clearAllPokemonBattleInfo() {
        trainerPokemonFullBattleInfo = nil
        wildPokemonFullBattleInfo = nil
    }
    
    func loadWildPokemonFullBattleInfo() throws {
        let randomPokemonSelectionNumber = Int.random(in: 1...100)
        guard let safeWildPokemon = pokemonLocationConfiguration.wildPokemon else {
            return
        }

        var prevRate = 0
        for pokemon in safeWildPokemon {
            let rate = pokemon.rate
            if ((prevRate+1)...(prevRate+rate)).contains(randomPokemonSelectionNumber) {
                do {
                    wildPokemonFullBattleInfo = try pokemonFullInfoLoadingService.fetchWildPokemonFullBattleInfo(wildPokemon: pokemon)
                } catch {
                    throw error
                }
                break
            }
            prevRate += rate
        }
    }
}
