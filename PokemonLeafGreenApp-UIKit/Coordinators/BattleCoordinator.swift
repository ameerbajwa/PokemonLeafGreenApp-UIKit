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
    var configuration: PokemonBattleConfiguration
    
//    var controller: BattleViewController
//    var viewModel: BattleViewModel
//    var battleView: PokemonBattleView
//    var battleActionView: PokemonBattleActionView
    
//    var pokemonBattleMoveListView: PokemonBattleMoveListView
//    var pokemonBattlePokemonListView: PokemonBattlePokemonListView
//    var pokemonBattleMoveView: PokemonBattleMoveView
//    var pokemonBattlePokemonSelectionView: PokemonBattlePokemonSelectionView
//    var pokemonBattleTextView: PokemonBattleTextView
    
    init(navigationController: UINavigationController, configuration: PokemonBattleConfiguration, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        self.configuration = configuration
        
//        self.battleView = PokemonBattleView()
//        self.battleActionView = PokemonBattleActionView()
//        self.viewModel = BattleViewModel()
//        self.controller = BattleViewController(viewModel: viewModel)
    }
    
    func start() {
//        self.controller.coordinator = self
//        navigationController.pushViewController(controller, animated: false)
    }
    
    func finish(configuration: PokemonCoordinatorConfiguration?) {
        self.navigationController.viewControllers.removeAll()
        rootCoordinator?.removeChildCoordinator(childCoordinator: self)
//        rootCoordinator?.startLocationCoordinator()
    }
}
