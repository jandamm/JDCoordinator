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

	/// This navigationController pushes all ViewControllers
	public let navigationController: UINavigationController

	/// Initialize the JDCoordinator a UINavigationController
	public required init(withNavigationController navigationController: UINavigationController) {
		self.navigationController = navigationController

		super.init()
	}

	/// You need to override this method so it pushes the initial ViewController.
	open func start() {
		NSLog("Error: Start method of JDCoordinator hasn't been overridden")
	}
}
