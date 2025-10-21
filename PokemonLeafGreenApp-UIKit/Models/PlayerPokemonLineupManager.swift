//
//  PlayerPokemonLineupManager.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 10/9/25.
//

public class PlayerPokemonLineupManager {
    var pokemonFullInfoLoadingService: PokemonFullInfoLoading
    var pokemonLineupFullInfo: [PokemonFullInfo]?
    
    init(pokemonFullInfoLoadingService: PokemonFullInfoLoading) {
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
    }
    
    func addPokemonToPlayerLineup(pokemonFullDetails: PokemonFullInfo) {
//        if let pokemonFullBattleAttributes = pokemonFullBattleAttributes, pokemonFullBattleAttributes.count < 6 {
//            
//        }
        
        //    func fetchAndSetAllPlayerPokemonBattleInfo() throws {
        //        let playerPokemonModels = try self.fetchPlayerPokemon()
        //
        //        let playerPokemonNames = pokemonBattleManager.playerPokemonFullBattleInfo.map { $0.name }
        //        for playerPokemon in playerPokemonModels {
        //            if !playerPokemonNames.contains(playerPokemon.name) {
        //                let newPokemonBattleInfo = try fetchPlayerPokemonFullBattleInfo(playerPokemon: playerPokemon)
        //                pokemonBattleManager.addPokemonToPlayerPokemonLineup(newPlayerPokemonFullBattleInfo: newPokemonBattleInfo)
        //            }
        //        }
        //    }
    }
}
