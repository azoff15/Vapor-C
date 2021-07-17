//
//  Router.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import UIKit

typealias RouterCompletion = () -> Void

protocol Routable: Presentable {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func present(_ module: Presentable?, animated: Bool, completion: RouterCompletion?)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: RouterCompletion?)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}

class Router: Presentable {
    var toPresent: UIViewController? {
        rootController
    }
    
    private var rootController: UINavigationController?
    
    init(navController: UINavigationController) {
        self.rootController = navController
    }
}

extension Router: Routable {
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        present(module, animated: animated, completion: nil)
    }
    
    func present(_ module: Presentable?, animated: Bool, completion: RouterCompletion?) {
        guard let controller = module?.toPresent else { return }
        rootController?.present(controller, animated: animated, completion: completion)
    }
    
    func push(_ module: Presentable?)  {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        guard
            let controller = module?.toPresent,
            !(controller is UINavigationController)
            else { assertionFailure("⚠️Deprecated push UINavigationController."); return }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule()  {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) { rootController?.popViewController(animated: animated)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: RouterCompletion?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) { rootController?.popToRootViewController(animated: animated)
    }
}

protocol RouterProtocol {
    associatedtype Routes
    
    func route(to: Routes, presentable: Presentable)
}
