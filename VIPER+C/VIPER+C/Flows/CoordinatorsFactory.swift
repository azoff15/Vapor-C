//
//  CoordinatorsFactory.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func makeAuthCoordinator(window: UIWindow) ->
    CoordinatableFactoryResult<AuthCoordinatorInput, AuthCoordinatorOutput>
}

struct CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeAuthCoordinator(window: UIWindow) ->
    CoordinatableFactoryResult<AuthCoordinatorInput, AuthCoordinatorOutput> {
        let dependencies = AuthCoordinatorDependencies(modulesFabric: AuthModulesFactory())
        let coordinator = AuthCoordinator(dependencies: dependencies, window: window)
        
        return AnyCoordinatable(coordinator)
    }
}
