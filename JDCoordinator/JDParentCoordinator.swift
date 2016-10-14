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

	fileprivate var _childCoordinator = [JDCoordinator]()
    
    /// List of all loaded ChildCoordinators
    var childCoordinator: [JDCoordinator] {
        return _childCoordinator
    }

	/// Add a JDCoordinator as a child
	public func addChildCoordinator(_ coordinator: JDCoordinator) {
		_childCoordinator.append(coordinator)
	}

	/// Remove a child JDCoordinator
	public func removeChildCoordinator(_ coordinator: JDCoordinator) {
		if let index = _childCoordinator.index(of: coordinator) {
			_childCoordinator.remove(at: index)
		}
	}

	/// Remove all child JDCoordinator
	public func removeAllChildCoordinator() {
		_childCoordinator.removeAll()
	}
}
