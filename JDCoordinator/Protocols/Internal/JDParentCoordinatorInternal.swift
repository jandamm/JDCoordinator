//
//  JDParentCoordinatorInternal.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

typealias _JDParentCoordinatorClass = NSObject & _JDParentCoordinatorProtocol

protocol _JDParentCoordinatorProtocol: JDParentCoordinatorProtocol {
    var childCoordinators: JDChildCoordinatorStorage { get set }
}

extension _JDParentCoordinatorProtocol {

    public func addChild(_ coordinator: JDChildCoordinatorClass) {
        guard let selfClass = self as? JDParentCoordinatorClass, !childCoordinators.contains(coordinator) else {
            return
        }

        if coordinator.parentCoordinator !== self {
            coordinator.parentCoordinator?.removeChild(coordinator)
        }

        childCoordinators.insert(coordinator)

        coordinator.setParent(to: selfClass)
    }

    public func removeChild(_ coordinator: JDChildCoordinatorClass) {
        childCoordinators.remove(coordinator)
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
}
