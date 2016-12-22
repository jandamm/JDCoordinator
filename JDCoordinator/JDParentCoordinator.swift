//
//  JDParentCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// JDParentCoordinator are meant to coordinate one or more JDCoordinators and ViewControllers.
@objc
open class JDParentCoordinator: JDCoordinator, JDParentCoordinatorProtocol, JDCoordinatorCoordinatorDelegate {

    /// List of all loaded ChildCoordinators
    public private(set) var childCoordinators: [JDCoordinator] = [JDCoordinator]()

	/// Add a JDCoordinator as a child
	public func addChildCoordinator(_ coordinator: JDCoordinator) {
		childCoordinators.append(coordinator)
	}

	/// Remove a child JDCoordinator
	public func removeChildCoordinator(_ coordinator: JDCoordinator) {
		if let index = childCoordinators.index(of: coordinator) {
			childCoordinators.remove(at: index)
		}
	}

	/// Remove all child JDCoordinator
	public func removeAllChildCoordinator() {
		childCoordinators.removeAll()
	}
}
