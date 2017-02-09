//
//  JDCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 30.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// JDCoordinators (JDChildCoordinators) are meant to coordinate one or more ViewControllers and have a parent
open class JDCoordinator: NSObject, JDNavigationCoordinatorProtocol, _JDChildCoordinatorProtocol, JDCoordinatorViewControllerDelegate {

    /// Initialize the JDCoordinator with a UINavigationController and adds it to a parentCoordinator
    /// - parameter navigationController: NavigationController where every navigation should start from.
    /// - parameter parentCoordinator: Coordinator that should be set as parent and where this coordinator will be added as child.
    public init(with navigationController: UINavigationController, andParent parentCoordinator: JDParentCoordinatorProtocol) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator

        super.init()

        parentCoordinator.addChild(self)
    }

    // MARK: - Protocols
    internal(set) public unowned var parentCoordinator: JDParentCoordinatorProtocol
    public unowned let navigationController: UINavigationController
    public weak var previousViewController: UIViewController?
    open func start() {}
}
