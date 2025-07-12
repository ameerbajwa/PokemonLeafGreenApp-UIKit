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
    var startView: StartView
    var startViewModel: StartViewModel
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
        
        self.startView = StartView()
        self.startViewModel = StartViewModel(pokeAPINetworkService: pokeAPINetworkService, startView: startView)
        
        self.startViewController = StartViewController(pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService, startViewModel: startViewModel)
    }
    
    func start() {
        self.startViewController.coordinator = self
        self.navigationController.pushViewController(self.startViewController, animated: false)
    }
    
    func finish() {
        print("finished")
    }
}
