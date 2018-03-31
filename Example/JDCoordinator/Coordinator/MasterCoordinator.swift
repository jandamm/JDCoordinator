//
//  MasterCoordinator.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 26.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

class MasterCoordinator: Coordinator {
    weak var delegate: (CoordinatorDelegate & MasterDelegate)!

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
        parentCoordinator?.removeChild(self)
        delegate.close()
    }
}
