//
//  JDParentCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

public typealias JDParentCoordinatorClass = NSObject & JDParentCoordinatorProtocol

/// Defines Coordinator which can have children.
/// If you're adopting this protocol by yourself you have to add a strong reference to child coordinators.
/// You can use JDChildCoordinatorStorage. It's based on a Set but can contain every ChildCoordinator.
public protocol JDParentCoordinatorProtocol: JDBaseCoordinatorProtocol {

    /// Adds a JDCoordinator as a child and removes it from previous parentCoordinator.
    ///
    /// You do not have to both setParent(to:) and addChild(:)
    ///
    /// - parameter coordinator: Coordinator which should be added as child.
    func addChild(_ coordinator: JDChildCoordinatorClass)

    /// Removes coordinator from childCoordinators
    /// - parameter coordinator: Coordinator which should be removed
    func removeChild(_ coordinator: JDChildCoordinatorClass)

    /// Returns whether the given coordinator is a child of this parentCoordinator
    func hasChild(_ coordinator: JDChildCoordinatorClass) -> Bool
}

public extension JDParentCoordinatorProtocol where Self: NSObject {

    /// Adds a JDCoordinator as a child, removes it from previous parentCoordinator and starts it.
    /// - parameter coordinator: Coordinator which should be added as child.
    func addChild(andStart coordinator: JDChildCoordinatorClass) {
        addChild(coordinator)
        coordinator.start()
    }

    /// Removes multiple Coordinators
    /// - parameter coordinators: Coordinators which should be removed
    func removeChilds(_ coordinators: [JDChildCoordinatorClass]) {
        for coordinator in coordinators {
            removeChild(coordinator)
        }
    }

    /// Removes a whole branch of coordinators by giving one child within this tree.
    /// - parameter coordinator: ChildCoordinator whose tree should be removed.
    func removeChilds(withStackOf coordinator: JDChildCoordinatorClass) {
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

public extension Array where Element == JDParentCoordinatorClass {

    func index(for coordinator: Element) -> Int? {
        return index(where: { $0 === coordinator })
    }

    func contains(_ coordinator: Element) -> Bool {
        return index(for: coordinator) != nil
    }
}

public extension Array where Element == JDChildCoordinatorClass {

    func index(for coordinator: Element) -> Int? {
        return index(where: { $0 === coordinator })
    }

    func contains(_ coordinator: Element) -> Bool {
        return index(for: coordinator) != nil
    }
}
