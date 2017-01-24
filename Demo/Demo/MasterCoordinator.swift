//
//  MasterCoordinator.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 26.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

class MasterCoordinator: JDCoordinator {

    weak var delegate: (JDCoordinatorCoordinatorDelegate & MasterDelegate)!

    override func start() {
        super.start()

        let vc = MasterViewController()
        vc.delegate = self

        pushViewController(vc, animated: true)
    }

    deinit {
        NSLog("\(type(of: self)) got deinitialized")
    }
}

extension MasterCoordinator: MasterDelegate {

    func showDetail(withData data: String?) {
        delegate.showDetail(withData: data)
    }

    func close() {
        delegate.removeChildCoordinator(self)
        delegate.close()
    }
}
