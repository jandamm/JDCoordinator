//
//  JDCoordinator.swift
//  insighter
//
//  Created by Jan Dammshäuser on 30.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// JDCoordinator are meant to coordinate one or more ViewControllers
@objc
open class JDCoordinator: NSObject, JDCoordinatorProtocol {

    /// You can use this value to save the ViewController which were presented when you started the Coordinator
    public weak var previousViewController: UIViewController?

	/// This navigationController pushes all ViewControllers
	public unowned let navigationController: UINavigationController

	/// Initialize the JDCoordinator a UINavigationController
	public init(withNavigationController navigationController: UINavigationController) {
		self.navigationController = navigationController

		super.init()
	}

	/// You need to override this method so it pushes the initial ViewController.
    open func start() {}

    /// This method sets the currently presented ViewController of navigationController to previousViewController
    public func setPreviousViewControllerToCurrent() {
        previousViewController = navigationController.topViewController
    }
}
