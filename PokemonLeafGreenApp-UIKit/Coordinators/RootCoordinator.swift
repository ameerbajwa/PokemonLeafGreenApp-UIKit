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
    var startViewController: StartViewController
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        
        startViewController = StartViewController(pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService)
    }
    
    func start() {
        startViewController.coordinator = self
        navigationController.pushViewController(startViewController, animated: false)
    }
    
    func finish() {
        print("finished")
    }
}
