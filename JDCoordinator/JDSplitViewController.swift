//
//  JDSplitViewController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 19.12.2016.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

open class JDSplitViewController: UISplitViewController {

    public enum SetMasterVCError: Error {
        case alreadySet(String)
    }

    /// Reference to JDSplitViewControllers presenting coordinator
    public weak var coordinator: JDCoordinatorViewControllerDelegate?

    /// If you override, call coordinator?.presentedVC?(self, movedTo: parent)
    open override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        coordinator?.presentedVC?(self, movedTo: parent)
    }

    /// Method to set the masterViewController
    /// Don't call this method directly - call it on the SplitViewCoordinator.
    public func setMasterViewController(_ vc: UIViewController) throws {
        guard viewControllers.count == 0 else {
            throw SetMasterVCError.alreadySet("[JDCoordinator] Could not set MasterViewController as it's already set.")
        }

        addChildViewController(vc)
    }
}
