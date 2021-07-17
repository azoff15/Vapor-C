//
//  BaseCoordinatort.swift
//  VIPER+C
//
//  Created by vazov on 15.07.2021.
//

import UIKit

class BaseCoordinator<Router: RouterProtocol> {
    var router: Router
    private(set) var childCoordinators: [AnyObject] = []

    init(router: Router) {
        self.router = router
    }
    
    func addDependency(_ coordinator: AnyObject) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: AnyObject) {
        guard childCoordinators.isEmpty == false else {
            return
        }

        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter { $0 !== coordinator }
                .forEach { coordinator.removeDependency($0) }
        }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func removeAllDependencies() {
        childCoordinators.forEach { coordinator in
            removeDependency(coordinator)
        }
    }
}
