//
//  AppCoordinatorWorkItems.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import Foundation

enum AppCoordinatorInput {
    //Входные данные связанные с бизнес логикой приложения (например доменные объекты, или инструкции для формирования модулей)
    case none
    case showAuth
    case showOther
}

enum AppCoordinatorOutput {
    //То что координатор может отдать на выход (любой объект на основе которого родительский координатор делает дела)
    //back как по умолчанию что координатор закончил выполнение
    case back
}

protocol AppCoordinatorDelegate {
    //Реализация методов делегирующих из внутренних модулей
}

struct AppCoordinatorDependencies {
    //Завсисимости для координатора (фабрика модулей, сервисы и тд)
    var modulesFabric: AuthModulesFactoryProtocol
}

final class AppRouter: Router, RouterProtocol {
    //Класс для описания возможных переходов
    enum Routes {
    }
    
    func route(to: Routes, presentable: Presentable) {
        switch to {
        }
    }
}

