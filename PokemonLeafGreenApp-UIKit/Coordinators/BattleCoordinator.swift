//
//  BattleCoordinator.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 8/22/25.
//

import Foundation
import UIKit

class BattleCoordinator: ChildCoordinator {
    weak var rootCoordinator: RootCoordinator?
    var navigationController: UINavigationController
    
//    var controller: BattleViewController
//    var viewModel: BattleViewModel
//    var view: BattleView
    
    init(navigationController: UINavigationController, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        
//        self.view = IntroView()
//        self.configuration = PalletTownConfiguration()
//        self.dataManager = PokemonDataManager(pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService, pokemonLocationConfiguration: configuration)
//        self.viewModel = IntroViewModel(configuration: configuration, pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService, introView: view)
//        
//        self.controller = IntroViewController(dataManager: dataManager, introViewModel: viewModel, introView: view)
    }
    
    func start() {
//        self.controller.coordinator = self
//        navigationController.pushViewController(controller, animated: false)
    }
    
    func finish() {
        self.navigationController.viewControllers.removeAll()
        rootCoordinator?.removeChildCoordinator(childCoordinator: self)
//        rootCoordinator?.startLocationCoordinator()
    }
}
