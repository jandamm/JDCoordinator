//
//  JDParentCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

public protocol JDParentCoordinatorProtocol: JDBaseCoordinatorProtocol {
    var childCoordinators: [JDChildCoordinatorProtocol] { get }
    func addChildCoordinator(_ coordinator: JDChildCoordinatorProtocol)
    func removeChildCoordinator(_ coordinator: JDChildCoordinatorProtocol)
}

protocol JDParentCoordinatorProtocolHelper: JDParentCoordinatorProtocol {
    var childCoordinators: [JDChildCoordinatorProtocol] { get set }
}

public extension JDParentCoordinatorProtocol {

    /// Adds a JDCoordinator as a child and removes it from previous parentCoordinator.
    /// - parameter coordinator: The Coordinator that should be added as child.
    func addChildCoordinator(_ coordinator: JDChildCoordinatorProtocol) {
        guard let s = self as? JDParentCoordinatorProtocolHelper, let coordinator = coordinator as? JDChildCoordinatorProtocolHelper else {
            return
        }
        coordinator.parentCoordinator?.removeChildCoordinator(coordinator)
        s.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }

    /// Removes a child JDCoordinator.
    /// - parameter coordinator: The Coordinator that should be removed childCoordinators.
    func removeChildCoordinator(_ coordinator: JDChildCoordinatorProtocol) {
        guard let s = self as? JDParentCoordinatorProtocolHelper, let index = childCoordinators.index(where: { $0 === coordinator }) else {
            return
        }
        s.childCoordinators.remove(at: index)
    }

    /// Removes all childCoordinators.
    /// - parameter coordinator: The Coordinator that shouldn't be removed from childCoordinators.
    func removeAllChildCoordinators(except coordinator: JDChildCoordinatorProtocol? = nil) {
        guard let x = self as? JDParentCoordinatorProtocolHelper else {
            return
        }

        let oldCoordinators = childCoordinators
        x.childCoordinators.removeAll()

        guard let coordinator = coordinator, let _ = oldCoordinators.index(where: { $0 === coordinator }) else {
            return
        }
        x.childCoordinators.append(coordinator)
    }
}
