//
//  CommonProtocols.swift
//  VIPER+C
//
//  Created by vazov on 16.07.2021.
//

import UIKit

protocol PresenterWithInteractor {
    associatedtype Interactor
    var interactor: Interactor { get }
}

protocol InteractorWithWeakPresenter {
    associatedtype Presenter
    var presenter: Presenter? { get }
}

protocol ViewWithPresenter: BaseViewController, InteractorWithWeakPresenter {
    //тк у нас вью берется через сториборды мы не можем прокинуть в инит (а хотелось бы)
    func setupPresenter(presenter: Presenter)
}

protocol Presentable {
    var toPresent: UIViewController? { get }
}
