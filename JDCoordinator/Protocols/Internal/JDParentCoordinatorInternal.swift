//
//  JDParentCoordinatorInternal.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

typealias _JDParentCoordinatorClass = NSObject & _JDParentCoordinatorProtocol

protocol _JDParentCoordinatorProtocol: JDParentCoordinatorProtocol {
    var childCoordinators: [JDChildCoordinatorClass] { get set }
}

extension _JDParentCoordinatorProtocol {

    public func addChild(_ coordinator: JDChildCoordinatorClass) {
        guard !childCoordinators.contains(where: {coordinator === $0}) else {
            return
        }

        if coordinator.parentCoordinator !== self {
            coordinator.parentCoordinator.removeChild(coordinator)
        }

        childCoordinators.append(coordinator)

        coordinator.setParent(to: self as! JDParentCoordinatorClass)  // Unsafe unwrapping as _JDParentCoordinatorProtocol can only be used internally
    }

    public func removeChild(_ coordinator: JDChildCoordinatorClass) {
        guard let index = childCoordinators.index(where: {coordinator === $0}) else {
            return
        }

        childCoordinators.remove(at: index)
    }

    /// Removes all childCoordinators.
    /// - parameter type: Define which type of ChildCoordinators should stay childs.
    public func removeChilds(_ type: JDChildCoordinatorType) {
        let oldCoordinators = childCoordinators

        childCoordinators.removeAll()

        guard case let JDChildCoordinatorType.except(coordinator) = type, oldCoordinators.contains(where: {coordinator === $0 }) else {
            return
        }

        childCoordinators.append(coordinator)
    }
}
