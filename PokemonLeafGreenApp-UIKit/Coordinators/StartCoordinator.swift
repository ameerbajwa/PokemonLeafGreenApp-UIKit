//
//  StartCoordinator.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/15/25.
//

import Foundation
import UIKit

class StartCoordinator: ChildCoordinator {
    weak var rootCoordinator: RootCoordinator?
    var navigationController: UINavigationController
    
    var controller: StartViewController
    var viewModel: StartViewModel
    var view: StartView
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        
        self.view = StartView()
        self.viewModel = StartViewModel(pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService)
        self.controller = StartViewController(startViewModel: viewModel, startView: view)
    }
    
    func start() {
        self.controller.coordinator = self
        self.view.delegate = self.controller
        self.navigationController.pushViewController(controller, animated: false)
    }
    
    func finish(configuration: PokemonCoordinatorConfiguration? = nil) {
        self.navigationController.viewControllers.removeAll()
        rootCoordinator?.removeChildCoordinator(childCoordinator: self)
        rootCoordinator?.startIntroCoordinator()
    }
}
