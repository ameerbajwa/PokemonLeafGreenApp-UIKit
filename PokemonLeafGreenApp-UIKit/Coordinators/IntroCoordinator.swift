//
//  IntroCoordinator.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/15/25.
//

import Foundation
import UIKit

class IntroCoordinator: ChildCoordinator {
    weak var rootCoordinator: RootCoordinator?
    var navigationController: UINavigationController
    let pokeAPINetworkService: PokeAPINetworkService
    let coreDataNetworkService: CoreDataNetworkService
    
    var controller: IntroViewController?
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
    }
    
    func start() {
        self.controller = IntroViewController()
        self.controller?.coordinator = self
        guard let safeController = controller else {
            print("Could not present IntroViewController")
            return
        }
        navigationController.pushViewController(safeController, animated: false)
    }
    
    func finish() {
        
    }
}
