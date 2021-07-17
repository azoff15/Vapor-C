//
//  AuthInteractor.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import Foundation

protocol AuthInteractorProtocol: InteractorWithWeakPresenter {
}

final class AuthInteractor: AuthInteractorProtocol {
    typealias Presenter = AuthPresenter
    
    weak var presenter: AuthPresenter?
}
