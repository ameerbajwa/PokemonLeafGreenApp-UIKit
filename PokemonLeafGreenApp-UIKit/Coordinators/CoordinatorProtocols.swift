//
//  CoordinatorProtocols.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/2/25.
//

import Foundation
import UIKit

protocol BaseCoordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

protocol ParentCoordinator: BaseCoordinator, AnyObject {
    var childCoordinators: [ChildCoordinator] { get set }
    
    func addChildCoordinator(childCoordinator: ChildCoordinator)
    func removeChildCoordinator(childCoordinator: ChildCoordinator)
}

extension ParentCoordinator {
    func addChildCoordinator(childCoordinator: ChildCoordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(childCoordinator: ChildCoordinator) {
        for (index, coordinator) in self.childCoordinators.enumerated() {
            if coordinator === childCoordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

protocol ChildCoordinator: BaseCoordinator, AnyObject {    
    func finish()
}
