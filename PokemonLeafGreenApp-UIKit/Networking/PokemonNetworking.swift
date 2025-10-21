//
//  PokemonNetworking.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 9/17/25.
//

protocol PokemonNetworking {
    var pokeAPINetworkService: PokeAPINetworkService { get set }
    var coreDataNetworkService: CoreDataNetworkService { get set }
    var pokemonLocationConfiguration: PokemonLocationConfiguration { get set }
}
