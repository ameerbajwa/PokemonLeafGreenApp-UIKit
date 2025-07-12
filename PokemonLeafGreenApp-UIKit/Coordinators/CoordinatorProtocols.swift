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
    func finish()
}

protocol ParentCoordinator: BaseCoordinator, AnyObject {
    var childCoordinators: [ChildCoordinator] { get set }
    
    func addChild(child: ChildCoordinator)
    func removeChild(child: ChildCoordinator)
}

extension ParentCoordinator {
    func addChild(child: ChildCoordinator) {
        childCoordinators.append(child)
    }
    
    func removeChild(child: ChildCoordinator) {
        for (index, childCoordinator) in self.childCoordinators.enumerated() {
            if childCoordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

protocol ChildCoordinator: BaseCoordinator, AnyObject {
    var viewController: UIViewController { get set }
    
    func childFinished()
}
