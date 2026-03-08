//
//  WildPokemonManager.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 2/12/26.
//

public class WildPokemonManager {
    var pokemonFullInfoLoadingService: PokemonFullInfoLoading
    var wildPokemonConfigurations: [WildPokemonConfiguration]
    var wildPokemonFullInfo: PokemonFullInfo?
    
    init(pokemonFullInfoLoadingService: PokemonFullInfoLoading, wildPokemonConfigurations: [WildPokemonConfiguration]) {
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        self.wildPokemonConfigurations = wildPokemonConfigurations
    }
    
    func fillWildPokemonInfo() throws {
        do {
            let wildPokemonConfiguration = try selectRandomWildPokemonConfiguration()
            wildPokemonFullInfo = try pokemonFullInfoLoadingService.fetchWildPokemonFullInfo(wildPokemon: wildPokemonConfiguration)
        } catch {
            throw error
        }
    }
    
    func selectRandomWildPokemonConfiguration() throws -> WildPokemonConfiguration {
        let randomPokemonSelectionNumber = Int.random(in: 1...100)
        
        var prevRate = 0
        for wildPokemon in wildPokemonConfigurations {
            let rate = wildPokemon.rate
            if ((prevRate+1)...(prevRate+rate)).contains(randomPokemonSelectionNumber) {
                return wildPokemon
            }
            prevRate += rate
        }
        
        throw PokemonLeafGreenError.noWildPokemonConfigurationMatch
    }
}
