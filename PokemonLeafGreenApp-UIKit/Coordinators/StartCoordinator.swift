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
    let pokeAPINetworkService: PokeAPINetworkService
    let coreDataNetworkService: CoreDataNetworkService
    
    var controller: StartViewController?
    var viewModel: StartViewModel?
    var view: StartView?
    
    init(navigationController: UINavigationController, pokeAPINetworkService: PokeAPINetworkService, coreDataNetworkService: CoreDataNetworkService) {
        self.navigationController = navigationController
        self.pokeAPINetworkService = pokeAPINetworkService
        self.coreDataNetworkService = coreDataNetworkService
    }
    
    func start() {
        self.view = StartView()
        guard let safeView = view else {
            print("Could not present StartViewController")
            return
        }
        self.viewModel = StartViewModel(pokeAPINetworkService: self.pokeAPINetworkService, coreDataNetworkService: self.coreDataNetworkService, startView: safeView)
        guard let safeViewModel = viewModel else {
            print("Could not present StartViewController")
            return
        }
        self.controller = StartViewController(startViewModel: safeViewModel)
        self.controller?.coordinator = self
        guard let startController = self.controller else {
            print("Could not present StartViewController")
            return
        }
        self.navigationController.pushViewController(startController, animated: false)
    }
    
    func finish() {
        self.view = nil
        self.viewModel = nil
        self.controller = nil
        self.navigationController.popViewController(animated: false)
        rootCoordinator?.removeChildCoordinator(childCoordinator: self)
        rootCoordinator?.startIntroCoordinator()
    }
}
