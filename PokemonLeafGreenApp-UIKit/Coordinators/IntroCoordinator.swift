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
    var configuration: PokemonLocationConfiguration
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        
        self.view = IntroView()
        self.configuration = PalletTownConfiguration()
        self.viewModel = IntroViewModel(configuration: configuration, pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService, introView: view)
        self.controller = IntroViewController(introViewModel: viewModel, introView: view)
    }
    
    func start() {
        self.controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }
    
    func finish() {
        
    }
}
