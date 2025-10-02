//
//  PokemonNetworking.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/17/25.
//

protocol PokemonNetworking {
    var pokeAPINetworkService: PokeAPINetworkService { get }
    var coreDataNetworkService: CoreDataNetworkService { get }
    var pokemonLocationConfiguration: PokemonLocationConfiguration { get }
}
