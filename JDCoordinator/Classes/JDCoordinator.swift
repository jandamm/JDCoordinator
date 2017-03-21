//
//  JDCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 30.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/**
 The Coordinator is the simplest class in a NavigationController based application.

 The coordinator structure in your app can be seen as a tree. In this example the Coordinator is the end of any branch.
 A Coordinator can only manage ViewControllers and should not reference any other coordinator (except as delegate).
 */
open class JDCoordinator: NSObject, JDNavigationCoordinatorProtocol, _JDChildCoordinatorProtocol, JDCoordinatorViewControllerDelegate {

    /// Initialize the JDCoordinator with a UINavigationController and adds it to a parentCoordinator
    /// - parameter navigationController: NavigationController where any further navigation should take place.
    /// - parameter parentCoordinator: Coordinator that should reference this coordinator.
    public init(with navigationController: UINavigationController, andAddToParent parentCoordinator: JDParentCoordinatorProtocol) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator

        super.init()

        parentCoordinator.addChild(self)
    }

    // MARK: - Protocols
    internal(set) public weak var parentCoordinator: JDParentCoordinatorProtocol!
    public unowned let navigationController: UINavigationController
    public weak var previousViewController: UIViewController?
    open func start() {}
}
