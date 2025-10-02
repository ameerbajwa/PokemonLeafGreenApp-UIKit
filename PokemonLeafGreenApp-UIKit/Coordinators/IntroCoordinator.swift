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
    
    var controller: IntroViewController
    var viewModel: IntroViewModel
    var view: IntroView
    var configuration: PalletTownConfiguration
    var storageService: PokemonStorageService
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        
        self.view = IntroView()
        self.configuration = PalletTownConfiguration()
        self.storageService = PokemonStorageService(pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService, pokemonLocationConfiguration: configuration)
        self.viewModel = IntroViewModel(configuration: configuration, pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService, introView: view)
        
        self.controller = IntroViewController(storageService: storageService, introViewModel: viewModel, introView: view)
    }
    
    func start() {
        self.controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }
    
    func finish(configuration: PokemonCoordinatorConfiguration?) {
        self.navigationController.viewControllers.removeAll()
        rootCoordinator?.removeChildCoordinator(childCoordinator: self)
        if let safeBattleConfiguration = configuration?.battleConfiguration {
            rootCoordinator?.startBattleCoordinator(configuration: safeBattleConfiguration)
        }
    }
}
