//
//  PlayerPokemonLineupManager.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 10/9/25.
//

public class PlayerPokemonLineupManager {
    var pokemonFullInfoLoadingService: PokemonFullInfoLoading
    var pokemonLineupFullInfo: [PokemonFullInfo]
    
    init(pokemonFullInfoLoadingService: PokemonFullInfoLoading) {
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        pokemonLineupFullInfo = []
        pokemonLineupFullInfo.reserveCapacity(6)
    }
    
    func fillStartingLineup() throws {
        do {
            let playerPokemonLineup = try pokemonFullInfoLoadingService.fetchPlayerPokemon(with: .fetchPlayerPokemonLineup)
            for pokemon in playerPokemonLineup {
                try addPokemonToLineup(coreDataGamePlayerPokemon: pokemon)
            }
        } catch {
            throw error
        }
    }
    
    func addPokemonToLineup(coreDataGamePlayerPokemon: CoreDataGamePlayerPokemon) throws {
        do {
            let pokemonFullInfo = try pokemonFullInfoLoadingService.fetchPlayerPokemonFullInfo(playerPokemon: coreDataGamePlayerPokemon)
            pokemonLineupFullInfo.append(pokemonFullInfo)
        } catch {
            throw error
        }
    }
    
    func addPokemonToLineup(coreDataGamePlayerPokemon: CoreDataGamePlayerPokemon, to index: Int) throws {
        do {
            let pokemonFullInfo = try pokemonFullInfoLoadingService.fetchPlayerPokemonFullInfo(playerPokemon: coreDataGamePlayerPokemon)
            pokemonLineupFullInfo.insert(pokemonFullInfo, at: index)
        } catch {
            throw error
        }
    }
    
    func removePokemonFromLineup(at index: Int) {
        _ = pokemonLineupFullInfo.remove(at: index)
    }
    
    func swapPokemonInLineup(from indexA: Int, to indexB: Int) {
        pokemonLineupFullInfo.swapAt(indexA, indexB)
    }
}
