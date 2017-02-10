//
//  JDAppCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/**
 Use the AppCoordinator only in a NavigationController based application.

 The coordinator structure in your app can be seen as a tree. In this example the AppCoordinator is the root of every other coordinator.
 In order to prevent a coordinator from beeing deinitialized it has to have a strong reference somewhere.
 The AppCoordinator should either reference himself (as a singleton) or referenced by the AppDelegate.
 Every other coordinator should be referenced by the AppCoordinator or one of its childs.

 Use this class only once in your app. It should be the Coordinator where every navigation is started from.
 The AppCoordinator has to use the UINavigationController which the AppDelegate declares as keyWindow.

 Depending on your apps navigation structure, you may want to make it a singleton.
 */
open class JDAppCoordinator: NSObject, JDRootNavigationCoordinatorProtocol, _JDParentCoordinatorProtocol, JDCoordinatorCoordinatorDelegate, JDCoordinatorViewControllerDelegate {

    /// Initialize the JDAppCoordinator a UINavigationController
    /// - parameter navigationController: NavigationController which is keyWindow.rootViewController
    public init(with navigationController: UINavigationController) {
        self.navigationController = navigationController

        super.init()
    }

    // MARK: - Protocols
    internal(set) public var childCoordinators: [JDChildCoordinatorProtocol] = []
    public unowned let navigationController: UINavigationController
    open func start() {}
}
