//
//  TrainerPokemonSquadManager.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 2/12/26.
//

public class TrainerPokemonSquadManager {
    var pokemonFullInfoLoadingService: PokemonFullInfoLoading
    var pokemonTrainerConfiguration: PokemonTrainerConfiguration
    var pokemonLineupFullInfo: [PokemonFullInfo]
    
    init(pokemonFullInfoLoadingService: PokemonFullInfoLoading, pokemonTrainerConfiguration: PokemonTrainerConfiguration) {
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        self.pokemonTrainerConfiguration = pokemonTrainerConfiguration
        pokemonLineupFullInfo = []
    }
    
    func fillStartingLineup() throws {
        do {
            for trainerPokemon in pokemonTrainerConfiguration.pokemon {
                let trainerPokemonFullInfo = try pokemonFullInfoLoadingService.fetchTrainerPokemonFullInfo(trainerPokemon: trainerPokemon)
                pokemonLineupFullInfo.append(trainerPokemonFullInfo)
            }
        } catch {
            throw error
        }
    }
}
