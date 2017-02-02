//
//  JDParentCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// JDParentCoordinators are meant to coordinate one or more JDCoordinators and ViewControllers.
@objc
open class JDParentCoordinator: JDCoordinator, JDParentCoordinatorProtocol {

    /// List of all loaded ChildCoordinators
    private(set) public var childCoordinators = [JDCoordinator]()

    /// Add a JDCoordinator as a child
    public func addChildCoordinator(_ coordinator: JDCoordinator) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }

    /// Remove a child JDCoordinator
    public func removeChildCoordinator(_ coordinator: JDCoordinator) {
        if let index = childCoordinators.index(of: coordinator) {
            childCoordinators.remove(at: index)
        }
    }

    /// Remove all child JDCoordinator except the given one
    public func removeAllChildCoordinators(except coordinator: JDCoordinator? = nil) {
        let oldCoordinators = childCoordinators

        childCoordinators.removeAll()

        guard let coordinator = coordinator, let _ = oldCoordinators.index(of: coordinator) else {
            return
        }

        childCoordinators.append(coordinator)
    }
}
