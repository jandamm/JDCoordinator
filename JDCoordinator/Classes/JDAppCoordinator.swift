//
//  JDAppCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation
/// You may want to create a static let main: Self singleton.
open class JDAppCoordinator: NSObject, JDRootNavigationCoordinator, _JDParentCoordinatorProtocol, JDCoordinatorCoordinatorDelegate, JDCoordinatorViewControllerDelegate {

    internal(set) public var childCoordinators: [JDChildCoordinatorProtocol] = []

    /// This navigationController pushes all ViewControllers
    public unowned let navigationController: UINavigationController

    /// Initialize the JDCoordinator a UINavigationController
    /// - parameter navigationController: NavigationController where every navigation should start from.
    public init(with navigationController: UINavigationController) {
        self.navigationController = navigationController

        super.init()
    }

    /// You need to override this method so it pushes the initial ViewController.
    open func start() {}
}
