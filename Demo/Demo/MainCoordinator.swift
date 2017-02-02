//
//  MainCoordinator.swift
//  Demo
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol MainCoordinatorDelegate: JDCoordinatorCoordinatorDelegate {
    func reloadData()
}

class MainCoordinator: JDParentCoordinator, MainDelegate {

    weak var delegate: MainCoordinatorDelegate?

    override func start() {
        super.start()

        let mainVC = MainVC()

        mainVC.delegate = self

        setViewController(mainVC, animated: true)
    }

    func reloadData() {
        delegate?.removeChildCoordinator(self)
        delegate?.reloadData()
    }

//    func showSplit() {
//        showInterface()
//    }

//    func showInterface() {
//        let coord = SplitViewCoordinator(with: navigationController)
//        coord.delegate = self
//        addChildCoordinator(coord)
//        coord.start()
//    }

    deinit {
        NSLog("\(type(of: self)) got deinitialized")
    }
}
