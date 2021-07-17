//
//  BaseViewController.swift
//  KazanExpress
//
//  Created by Ashot Asoyan on 01.04.2021.
//

import UIKit

class BaseViewController: UIViewController, Presentable {
    var toPresent: UIViewController? {
        self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }

    func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: navigationItem.backBarButtonItem?.style ?? .plain, target: nil, action: nil)
//        navigationController?.navigationBar.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.grayDK40,
//            NSAttributedString.Key.font: UIFont.subheadingThick
//        ]
    }
}
