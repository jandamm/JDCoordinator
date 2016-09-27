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
open class JDParentCoordinator: JDCoordinator {

	fileprivate var childCoordinator = [JDCoordinator]()

	/// Add a JDCoordinator as a child
	public func addChildCoordinator(_ coordinator: JDCoordinator) {
		childCoordinator.append(coordinator)
	}

	/// Remove a child JDCoordinator
	public func removeChildCoordinator(_ coordinator: JDCoordinator) {
		if let index = childCoordinator.index(of: coordinator) {
			childCoordinator.remove(at: index)
		}
	}

	/// Remove all child JDCoordinator
	public func removeAllChildCoordinator() {
		childCoordinator.removeAll()
	}
}
