//
//  SplitViewCoordinator.swift
//  Demo
//
//  Created by Jan Dammshäuser on 19.12.2016.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol SplitViewCoordinatorDelegate: MainCoordinatorDelegate {}

class SplitViewCoordinator: JDParentCoordinator, JDSplitViewCoordinatorProtocol {

    weak var delegate: SplitViewCoordinatorDelegate!
    
    lazy var manager: JDSplitViewManager = { SplitViewManager(withNavigationController: self.navigationController, andMode: .always) }()

    override func start() {
        super.start()

        if let vc = manager.splitViewPresenter {
            showMainVC()
            showDetailVC()

            setViewControllers(vc, animated: true)
        } else {
            showMainVC()
        }
    }

    fileprivate func showMainVC() {
        let coord = MainCoordinator(withNavigationController: manager.leftController)
        coord.delegate = self

        addChildCoordinator(coord)

        coord.start()
    }

    fileprivate func showDetailVC() {
        let coord = DetailCoordinator(withNavigationController: manager.rightController)
        coord.delegate = self

        addChildCoordinator(coord)
        coord.start()
    }

    deinit {
        NSLog("SplitViewCoordinator got deinitialized")
    }
}

extension SplitViewCoordinator: MainCoordinatorDelegate, DetailCoordinatorDelegate {

    func reloadData(_ finishedCoordinator: JDCoordinator) {
        removeChildCoordinator(finishedCoordinator)
        
        delegate.reloadData(self)
    }
}
