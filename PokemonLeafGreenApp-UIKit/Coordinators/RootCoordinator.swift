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
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
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
        let introCoordinator = IntroCoordinator(navigationController: navigationController, pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService)
        self.addChildCoordinator(childCoordinator: introCoordinator)
        introCoordinator.rootCoordinator = self
        introCoordinator.start()
    }
}
