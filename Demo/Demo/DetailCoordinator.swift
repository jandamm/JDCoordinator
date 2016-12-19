//
//  DetailCoordinator.swift
//  Demo
//
//  Created by Jan Dammshäuser on 19.12.2016.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol DetailCoordinatorDelegate: JDCoordinatorDelegate {}

class DetailCoordinator: JDCoordinator {

    weak var delegate: DetailCoordinatorDelegate!

    override func start() {
        let vc = DetailViewController()

        pushViewController(vc, animated: true)

        super.start()
    }

    deinit {
        NSLog("DetailCoordinator got deinitialized")
    }
}
