//
//  RootCoordinator.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/2/25.
//

import Foundation
import UIKit

class RootCoordinator: ParentCoordinator {
    var navigationController: UINavigationController
    var childCoordinators = [ChildCoordinator]()
    
    let pokeAPINetworkService: PokeAPINetworkService
    let coreDataNetworkService: CoreDataNetworkService
    var pokemonStorageService: PokemonNetworkCheckingAndStoring
    let pokemonFullInfoLoadingService: PokemonFullInfoLoading
    let pokemonLocationConfigurationService: PokemonLocationConfigurationService
    
    let pokemonLocationConfigurationLinkedList: PokemonLocationConfigurationDoublyLinkedList
    var currentPokemonLocationConfigurationNode: PokemonLocationConfigurationNode?
    
    init(navigationController: UINavigationController,
         pokeAPINetworkService: PokeAPINetworkService,
         coreDataNetworkService: CoreDataNetworkService,
         pokemonStorageService: PokemonNetworkCheckingAndStoring,
         pokemonFullInfoLoadingService: PokemonFullInfoLoading,
         pokemonLocationConfigurationService: PokemonLocationConfigurationService) {
        self.navigationController = navigationController
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        self.pokemonStorageService = pokemonStorageService
        self.pokemonFullInfoLoadingService = pokemonFullInfoLoadingService
        self.pokemonLocationConfigurationService = pokemonLocationConfigurationService
        
        pokemonLocationConfigurationLinkedList = pokemonLocationConfigurationService.createPokemonLocationConfigurationLinkedList()
    }
    
    func start() {
        let startCoordinator = StartCoordinator(navigationController: navigationController, pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService)
        self.addChildCoordinator(childCoordinator: startCoordinator)
        startCoordinator.rootCoordinator = self
        startCoordinator.start()
    }
}

// MARK: - Coordinate to Intro
extension RootCoordinator {
    func startIntroCoordinator() {
        currentPokemonLocationConfigurationNode = pokemonLocationConfigurationLinkedList.startLocation
        guard let currentPokemonLocationConfiguration = currentPokemonLocationConfigurationNode?.configuration else {
            return
        }
        let introCoordinator = IntroCoordinator(navigationController: navigationController,
                                                pokeAPINetworkService: pokeAPINetworkService,
                                                coreDataNetworkService: coreDataNetworkService,
                                                storageService: pokemonStorageService,
                                                pokemonLocationConfiguration: currentPokemonLocationConfiguration)
        self.addChildCoordinator(childCoordinator: introCoordinator)
        introCoordinator.rootCoordinator = self
        introCoordinator.start()
    }
}

// MARK: - Coordinate to Battle
extension RootCoordinator {
    // when starting battle coordinator, keep existing location coordiantor/controller in stack
    func startBattleCoordinator(configuration: PokemonBattleConfiguration) {
        let battleCoordinator = BattleCoordinator(navigationController: navigationController, configuration: configuration, coreDataNetworkService: coreDataNetworkService)
        self.addChildCoordinator(childCoordinator: battleCoordinator)
        battleCoordinator.rootCoordinator = self
        battleCoordinator.start()
    }
}

// MARK: - Coordinate to Location
extension RootCoordinator {
    func startLocationCoordinator() {}
    // Need to know whether to go to the existing location or next one
    // If existing, how do we update what the player has done? i.e. which trainer's he has faced
    // only remove location coordinator/controller from root coorindator childCoordinators when moving to the next location
    // when switching locations, check encounterRival boolean then call addRivalTrainer method on location
}
