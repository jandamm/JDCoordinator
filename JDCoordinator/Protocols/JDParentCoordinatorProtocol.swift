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

/// Defines Coordinator which can have children.
public protocol JDParentCoordinatorProtocol: JDBaseCoordinatorProtocol {

    /// All ChildCoordinators.
    var childCoordinators: [JDChildCoordinatorProtocol] { get }

    /// Adds a JDCoordinator as a child and removes it from previous parentCoordinator.
    ///
    /// You do not have to both setParent(to:) and addChild(:)
    ///
    /// - parameter coordinator: Coordinator which should be added as child.
    func addChild(_ coordinator: JDChildCoordinatorProtocol)

    /// Removes coordinator from childCoordinators
    /// - parameter coordinator: Coordinator which should be removed
    func removeChild(_ coordinator: JDChildCoordinatorProtocol)
}

protocol _JDParentCoordinatorProtocol: JDParentCoordinatorProtocol {
    var childCoordinators: [JDChildCoordinatorProtocol] { get set }
}

public extension Array where Element == JDParentCoordinatorProtocol {

    func index(for coordinator: Element) -> Int? {
        return index(where: { $0 === coordinator })
    }

    func contains(_ coordinator: Element) -> Bool {
        return index(for: coordinator) != nil
    }
}

public extension Array where Element == JDChildCoordinatorProtocol {

    func index(for coordinator: Element) -> Int? {
        return index(where: { $0 === coordinator })
    }

    func contains(_ coordinator: Element) -> Bool {
        return index(for: coordinator) != nil
    }
}

public extension JDParentCoordinatorProtocol {

    /// Adds a JDCoordinator as a child, removes it from previous parentCoordinator and starts it.
    /// - parameter coordinator: Coordinator which should be added as child.
    func addChild(andStart coordinator: JDChildCoordinatorProtocol) {
        addChild(coordinator)
        coordinator.start()
    }

    /// Removes multiple Coordinators
    /// - parameter coordinators: Coordinators which should be removed
    func removeChilds(_ coordinators: [JDChildCoordinatorProtocol]) {
        for coordinator in coordinators {
            removeChild(coordinator)
        }
    }

    /// Removes all Coordinators except the given ones
    /// - parameter coordinators: Coordinators which should not be removed
    func removeChilds(except coordinators: [JDChildCoordinatorProtocol]) {
        for coordinator in childCoordinators.filter({ !coordinators.contains($0) }) {
            removeChild(coordinator)
        }
    }

    /// Removes a whole branch of coordinators by giving one child within this tree.
    /// - parameter coordinator: ChildCoordinator whose tree should be removed.
    func removeChilds(withStackOf coordinator: JDChildCoordinatorProtocol) {
        guard coordinator.parentCoordinator !== self else {
            return removeChild(coordinator)
        }

        guard let index = coordinator.parentCoordinators.index(for: self) else {
            return
        }

        let coordinator = coordinator.childStack[index]
        removeChild(coordinator)
    }
}

extension _JDParentCoordinatorProtocol {

    public func addChild(_ coordinator: JDChildCoordinatorProtocol) {
        guard !childCoordinators.contains(coordinator) else {
            return
        }

        if coordinator.parentCoordinator !== self {
            coordinator.parentCoordinator.removeChild(coordinator)
        }

        childCoordinators.append(coordinator)

        coordinator.setParent(to: self)
    }

    public func removeChild(_ coordinator: JDChildCoordinatorProtocol) {
        guard let index = childCoordinators.index(for: coordinator) else {
            return
        }

        childCoordinators.remove(at: index)
    }

    /// Removes all childCoordinators.
    /// - parameter type: Define which type of ChildCoordinators should stay childs.
    public func removeChilds(_ type: JDChildCoordinatorType) {
        let oldCoordinators = childCoordinators

        childCoordinators.removeAll()

        guard case let JDChildCoordinatorType.except(coordinator) = type, oldCoordinators.contains(coordinator) else {
            return
        }

        childCoordinators.append(coordinator)
    }
}
