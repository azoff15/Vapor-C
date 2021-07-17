//
//  AppCoordinator.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import UIKit

final class AppCoordinator: BaseCoordinator<AppRouter>, Coordinatable {
    
    typealias InputType = AppCoordinatorInput
    typealias OutputType = AppCoordinatorOutput
    
    var output: ((AppCoordinatorOutput) -> Void)?
    
    private var window: UIWindow
    private var coordinatorFactory: CoordinatorFactoryProtocol
    
    init(window: UIWindow, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        super.init(router: AppRouter(navController: UINavigationController()))
    }
    
    func start(with option: AppCoordinatorInput, animated: Bool) {
        switch option {
        case .showAuth:
            showAuthCoordinator()
        case .showOther:
            showOther()
        default: break
        }
    }
    
    private func showAuthCoordinator() {
        let coordinator = coordinatorFactory.makeAuthCoordinator(window: window)
        coordinator.start(with: .none, animated: true)
        addDependency(coordinator)
        coordinator.output = { [weak self, weak coordinator] output in
            guard let coordinator = coordinator else { return }
            switch output {
            case .back:
                self?.removeDependency(coordinator)
            }
        }
    }
    
    private func showOther() {
        
    }
}

