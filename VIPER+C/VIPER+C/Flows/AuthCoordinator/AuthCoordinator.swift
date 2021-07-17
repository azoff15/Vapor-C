//
//  AuthCoordinator.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import UIKit

final class AuthCoordinator: BaseCoordinator<AuthRouter>, Coordinatable {
    
    typealias InputType = AuthCoordinatorInput
    typealias OutputType = AuthCoordinatorOutput
    
    var output: ((AuthCoordinatorOutput) -> Void)?
    
    private var dependencies: AuthCoordinatorDependencies
    private var window: UIWindow
    
    init(dependencies: AuthCoordinatorDependencies, window: UIWindow) {
        self.dependencies = dependencies
        let router = AuthRouter(navController: UINavigationController())
        self.window = window
        super.init(router: router)
    }
    
    func start(with option: AuthCoordinatorInput, animated: Bool) {
        let authModule = dependencies.modulesFabric.makeAuthModule()
        router.setRootModule(authModule)
        self.window.rootViewController = router.toPresent
    }
}
