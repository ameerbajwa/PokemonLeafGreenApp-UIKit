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
    var mainView: IntroView
    var textView: IntroTextView
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService, storageService: PokemonNetworkCheckingAndStoring, pokemonLocationConfiguration: PokemonLocationConfiguration) {
        print("IntroCoordinator created and stored in memory")
        self.navigationController = navigationController
        
        self.mainView = IntroView()
        self.textView = IntroTextView()
        self.viewModel = IntroViewModel(locationConfiguration: pokemonLocationConfiguration, pokeAPINetworkService: pokeAPINetworkService, coreDataNetworkService: coreDataNetworkService, pokemonStorageService: storageService)
        self.controller = IntroViewController(introViewModel: viewModel, introView: mainView, introTextView: textView)
    }
    
    deinit {
        print("IntroCoordinator removed from memory")
    }
    
    func start() {
        self.controller.coordinator = self
        self.textView.introButtonDelegate = self.controller
        self.mainView.delegate = self.controller
        
        self.viewModel.delegate = self.controller
        navigationController.pushViewController(controller, animated: false)
    }
    
    func finish(configuration: PokemonCoordinatorConfiguration?) {
        self.navigationController.viewControllers.removeAll()
        rootCoordinator?.removeChildCoordinator(childCoordinator: self)
        if let opposingBattleConfiguration = configuration?.battleConfiguration {
            rootCoordinator?.startBattleCoordinator(opposingBattleConfiguration: opposingBattleConfiguration)
        }
    }
}
