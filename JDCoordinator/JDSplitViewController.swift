//
//  JDSplitViewController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 19.12.2016.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

public protocol JDSplitViewDelegate: JDCoordinatorDelegate {
    func splitViewClosed()
}

public class JDSplitViewController: UISplitViewController {

    public weak var coordinator: JDSplitViewDelegate!

    override public func didMove(toParentViewController parent: UIViewController?) {
        guard parent == nil else {
            return
        }

        coordinator.splitViewClosed()
    }
}
