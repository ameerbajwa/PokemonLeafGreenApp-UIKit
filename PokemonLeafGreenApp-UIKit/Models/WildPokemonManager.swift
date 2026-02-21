//
//  WildPokemonManager.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 2/12/26.
//

public class WildPokemonManager {
    var pokemonFullInfoLoadingService: PokemonFullInfoLoading
    var wildPokemonConfiguration: WildPokemonConfiguration
    var wildPokemonFullInfo: PokemonFullInfo?
    
    init(pokemonFullInfoLoadingService: PokemonFullInfoLoading, wildPokemonConfiguration: WildPokemonConfiguration) {
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        self.wildPokemonConfiguration = wildPokemonConfiguration
    }
    
    func fillWildPokemonInfo() throws {
        do {
            wildPokemonFullInfo = try pokemonFullInfoLoadingService.fetchWildPokemonFullInfo(wildPokemon: wildPokemonConfiguration)
        } catch {
            throw error
        }
    }
}
