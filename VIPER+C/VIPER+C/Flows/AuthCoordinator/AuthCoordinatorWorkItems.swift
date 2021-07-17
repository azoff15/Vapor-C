//
//  AuthDependencies.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import Foundation

enum AuthCoordinatorInput {
    //Входные данные связанные с бизнес логикой приложения (например доменные объекты, или инструкции для формирования модулей)
    case none
}

enum AuthCoordinatorOutput {
    //То что координатор может отдать на выход (любой объект на основе которого родительский координатор делает дела)
    //back как по умолчанию что координатор закончил выполнение
    case back
}

struct AuthCoordinatorDependencies {
    //Завсисимости для координатора (фабрика модулей, сервисы и тд)
    var modulesFabric: AuthModulesFactoryProtocol
}

final class AuthRouter: Router, RouterProtocol {
    //Класс для описания возможных переходов
    enum Routes {
    }
    
    func route(to: Routes, presentable: Presentable) {
        switch to {
        }
    }
}
