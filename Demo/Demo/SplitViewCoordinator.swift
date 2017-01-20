//
//  SplitCoord.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 24.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

class SplitViewCoordinator: JDSplitViewCoordinator {

    weak var delegate: JDCoordinatorCoordinatorDelegate!

    override func start() {
        super.start()

        setupMaster()

        pushViewController(splitViewPresenter, animated: true)
    }

    func setupMaster() {
        let vc = UINavigationController()
        let coord = MasterCoordinator(withNavigationController: vc)
        coord.delegate = self

        setMasterNavigationController(vc, withMasterCoordinator: coord, andStart: true)
    }

    deinit {
        NSLog("\(type(of: self)) got deinitialized")
    }
}

extension SplitViewCoordinator: MasterDelegate {

    func close() {
        navigationController.popViewController(animated: true)
        delegate.removeChildCoordinator(self)
    }

    func showDetail(withData data: String?) {
        let dvc = UINavigationController()
        let coord = DetailCoordinator(withNavigationController: dvc)

        coord.delegate = self
        coord.data = data

        showDetailNavigationController(dvc, withDetailCoordinator: coord, andStart: true)
    }
}
