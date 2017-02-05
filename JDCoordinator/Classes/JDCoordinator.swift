//
//  JDCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 30.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// JDCoordinators are meant to coordinate one or more ViewControllers
open class JDCoordinator: NSObject, JDChildCoordinatorProtocol, JDChildCoordinatorProtocolHelper, JDCoordinatorViewControllerDelegate, JDNavigationCoordinator {

    /// Returns direct parentCoordinator
    internal(set) public weak var parentCoordinator: JDParentCoordinatorProtocol?

    /// This navigationController pushes all ViewControllers
    public unowned let navigationController: UINavigationController

    /// You can use this value to save the ViewController which were presented when you started the Coordinator
    public weak var previousViewController: UIViewController?

    /// Initialize the JDCoordinator a UINavigationController
    /// - parameter navigationController: NavigationController where every navigation should start from.
    public init(with navigationController: UINavigationController) {
        self.navigationController = navigationController

        super.init()
    }

    /// You need to override this method so it pushes the initial ViewController.
    open func start() {}
}
