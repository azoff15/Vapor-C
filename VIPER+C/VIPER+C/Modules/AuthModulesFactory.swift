//
//  AuthModulesFactory.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import Foundation

protocol AuthModulesFactoryProtocol {
    func makeAuthModule() -> Presentable
}

struct AuthModulesFactory: AuthModulesFactoryProtocol {
    func makeAuthModule() -> Presentable {
        AuthModuleConfigurator().configure()
    }
}
