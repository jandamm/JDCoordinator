//
//  _JDParentCoordinating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

protocol _JDParentCoordinating: JDParentCoordinating {
    var childCoordinators: JDChildCoordinatorStorage { get set }
}

extension _JDParentCoordinating {

    public func addChild(_ coordinator: JDChildCoordinating) {
        guard !childCoordinators.contains(coordinator) else {
            return
        }

        if coordinator.parentCoordinator !== self {
            coordinator.parentCoordinator?.removeChild(coordinator)
        }

        childCoordinators.insert(coordinator)

        coordinator.setParent(to: self)
    }

    public func removeChild(_ coordinator: JDChildCoordinating) {
        childCoordinators.remove(coordinator)
    }

    public func hasChild(_ coordinator: JDChildCoordinating) -> Bool {
        return childCoordinators.contains(coordinator)
    }

    /// Removes all childCoordinators.
    /// - parameter type: Define which type of ChildCoordinators should stay childs.
    public func removeChilds(_ type: JDChildCoordinatorType) {
        let oldCoordinators = childCoordinators

        childCoordinators.removeAll()

        guard case let JDChildCoordinatorType.except(coordinator) = type, oldCoordinators.contains(coordinator) else {
            return
        }

        childCoordinators.insert(coordinator)
    }

    /// Removes all Coordinators except the given ones
    /// - parameter coordinators: Coordinators which should not be removed
    func removeChilds(except coordinators: [JDChildCoordinating]) {
        for coordinator in childCoordinators.subtracting(coordinators) {
            removeChild(coordinator)
        }
    }
}
