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

    /// List of all ChildCoordinators
    private(set) public var childCoordinators = [JDCoordinator]()

    /// Adds a JDCoordinator as a child and removes it from previous parentCoordinator.
    /// - parameter coordinator: The Coordinator that should be added as child.
    public func addChildCoordinator(_ coordinator: JDCoordinator) {
        coordinator.parentCoordinator?.removeChildCoordinator(coordinator)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }

    /// Removes a child JDCoordinator.
    /// - parameter coordinator: The Coordinator that should be removed childCoordinators.
    public func removeChildCoordinator(_ coordinator: JDCoordinator) {
        if let index = childCoordinators.index(of: coordinator) {
            childCoordinators.remove(at: index)
        }
    }

    /// Removes all childCoordinators.
    /// - parameter coordinator: The Coordinator that shouldn't be removed from childCoordinators.
    public func removeAllChildCoordinators(except coordinator: JDCoordinator? = nil) {
        let oldCoordinators = childCoordinators

        childCoordinators.removeAll()

        guard let coordinator = coordinator, let _ = oldCoordinators.index(of: coordinator) else {
            return
        }

        childCoordinators.append(coordinator)
    }
}
