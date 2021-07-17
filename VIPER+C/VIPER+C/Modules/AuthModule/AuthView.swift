//
//  AuthView.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import UIKit

final class AuthView: BaseViewController, ViewWithPresenter {
    typealias Presenter = AuthPresenter
    
    private(set) var presenter: Presenter?
    
    func setupPresenter(presenter: Presenter) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
