//
//  JDSplitViewController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 19.12.2016.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

open class JDSplitViewController: UISplitViewController {

    /// Reference to JDSplitViewControllers presenting coordinator
    public weak var coordinator: JDCoordinatorViewControllerDelegate?

    /// If you override, call coordinator?.presentedVC?(self, movedTo: parent)
    override open func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        coordinator?.presentedVC?(self, movedTo: parent)
    }

    /// Method to set the masterViewController
    /// Don't call this method directly - call it on the SplitViewCoordinator.
    public func showMasterViewController(_ vc: UIViewController) {
        // TODO: - ensure that given vc is always first in stack
        addChildViewController(vc)
    }
}
