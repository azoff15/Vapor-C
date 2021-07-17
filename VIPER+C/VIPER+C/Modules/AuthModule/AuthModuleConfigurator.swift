//
//  AuthModuleConfigurator.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import UIKit

struct AuthModuleConfigurator {
    func configure() -> Presentable {
        let view = AuthView()
        var interactor = AuthInteractor()
        let presenter = AuthPresenter(interactor: &interactor,
                                      viewModel: AuthViewModel())
        
        view.setupPresenter(presenter: presenter)
        
        return view
    }
}
