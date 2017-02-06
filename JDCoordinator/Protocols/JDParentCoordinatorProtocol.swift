//
//  JDParentCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

public enum JDChildCoordinatorType {
    case all, except(JDChildCoordinatorProtocol)
}

public protocol JDParentCoordinatorProtocol: JDBaseCoordinatorProtocol {
    var childCoordinators: [JDChildCoordinatorProtocol] { get }
    func addChild(_ coordinator: JDChildCoordinatorProtocol)
    func removeChild(_ coordinator: JDChildCoordinatorProtocol)
}

protocol _JDParentCoordinatorProtocol: JDParentCoordinatorProtocol {
    var childCoordinators: [JDChildCoordinatorProtocol] { get set }
}

// Wait for Swift 3.1
// public extension Array where Element == JDChildCoordinatorProtocol {
//
//    func index(for coordinator: JDChildCoordinatorProtocol) -> Int? {
//        return self.index(where: { $0 === coordinator })
//    }
// }

extension _JDParentCoordinatorProtocol {

    /// Adds a JDCoordinator as a child and removes it from previous parentCoordinator.
    /// - parameter coordinator: Has to be a subclass of JDCoordinator default classes.
    public func addChild(_ coordinator: JDChildCoordinatorProtocol) {
        coordinator.parentCoordinator?.removeChild(coordinator)
        childCoordinators.append(coordinator)
        coordinator.setParent(to: self)
    }

    /// Removes a child JDCoordinator.
    /// - parameter coordinator: The Coordinator that should be removed childCoordinators.
    public func removeChild(_ coordinator: JDChildCoordinatorProtocol) {
        guard let index = childCoordinators.index(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.remove(at: index)
    }

    /// Removes all childCoordinators.
    /// - parameter coordinator: The Coordinator that shouldn't be removed from childCoordinators.
    public func removeChilds(_ type: JDChildCoordinatorType) {
        let oldCoordinators = childCoordinators
        childCoordinators.removeAll()

        guard case JDChildCoordinatorType.except(let coordinator) = type, let _ = oldCoordinators.index(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }
}
