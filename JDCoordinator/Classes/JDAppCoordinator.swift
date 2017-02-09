//
//  JDAppCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Use this class only once in your app. It should be the Coordinator where every navigation is started from.
///
/// You may want to create a static let main: Self singleton.
open class JDAppCoordinator: NSObject, JDRootNavigationCoordinatorProtocol, _JDParentCoordinatorProtocol, JDCoordinatorCoordinatorDelegate, JDCoordinatorViewControllerDelegate {

    /// Initialize the JDCoordinator a UINavigationController
    /// - parameter navigationController: NavigationController where every navigation should start from.
    public init(with navigationController: UINavigationController) {
        self.navigationController = navigationController

        super.init()
    }

    // MARK: - Protocols
    internal(set) public var childCoordinators: [JDChildCoordinatorProtocol] = []
    public unowned let navigationController: UINavigationController
    open func start() {}
}
