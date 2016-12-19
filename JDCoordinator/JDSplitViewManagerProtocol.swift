//
//  JDSplitViewManagerProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 19.12.2016.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Blueprint of JDSplitViewManagerProtocol
@objc
public protocol JDSplitViewManagerProtocol: NSObjectProtocol, UISplitViewControllerDelegate {
    var mode: JDSplitViewManager.SplitViewMode { get }

    init(withNavigationController navigationController: UINavigationController, andMode mode: JDSplitViewManager.SplitViewMode, leftNavigationController left: UINavigationController?, rightNavigationController right: UINavigationController?)

    var splitViewPresenter: UIViewController? { get }
    var splitViewController: JDSplitViewController { get }
    var leftController: UINavigationController { get }
    var rightController: UINavigationController { get }
}
