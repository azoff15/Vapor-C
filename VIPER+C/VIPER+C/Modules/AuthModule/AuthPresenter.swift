//
//  AuthPresenter.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import Foundation

protocol AuthPresenterDelegate: AnyObject {
}

protocol AuthPresenterProtocol: PresenterWithInteractor {
    var viewModel: AuthViewModelProtocol { get }
}

final class AuthPresenter: AuthPresenterProtocol {
    var viewModel: AuthViewModelProtocol
    
    typealias Interactor = AuthInteractor
    weak var delegate: AuthPresenterDelegate?
    
    var interactor: AuthInteractor
    
    init(interactor: inout AuthInteractor, viewModel: AuthViewModelProtocol) {
        self.interactor = interactor
        self.viewModel = viewModel
        interactor.presenter = self
    }
}
