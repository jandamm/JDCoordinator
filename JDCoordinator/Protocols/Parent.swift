//
//  Parent.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Defines parents of coordinators.
public typealias ParentCoordinating = Coordinating & Parent

/// If you're adopting this protocol by yourself you have to add a strong reference to child coordinators.
/// You can use `ChildStorage` or implement a `ChildStoraging`.
public protocol Parent: AnyObject {
    /// Adds a `Child` and removes it from previous `parentCoordinator`.
    ///
    /// You do not have to both `setParent(to:)` and `addChild(:)`
    ///
    /// - parameter coordinator: `Coordinator` which should be added as child.
    func addChild(_ coordinator: Child)

    /// Removes `Child` from `childCoordinators`
    /// - parameter coordinator: Coordinator which should be removed
    func removeChild(_ coordinator: Child)

    /// Returns whether the given `Child` is a child of this parentCoordinator
    func hasChild(_ coordinator: Child) -> Bool
}

public extension Parent {
    /// Adds a `Coordinator` as a child, removes it from previous `parentCoordinator` and starts it.
    /// - parameter coordinator: Coordinator which should be added as child.
    func addChildAndStart(_ coordinator: ChildCoordinating) {
        addChild(coordinator)
        coordinator.start()
    }

    /// Removes multiple `Child`s
    /// - parameter coordinators: Coordinators which should be removed
    func removeChilds(_ coordinators: [Child]) {
        for coordinator in coordinators {
            removeChild(coordinator)
        }
    }

    /// Removes a whole branch of coordinators by giving one child within this tree.
    /// - parameter coordinator: ChildCoordinator whose tree should be removed.
    func removeChildTree(of coordinator: ChildCoordinating) {
        guard coordinator.parentCoordinator !== self else {
            return removeChild(coordinator)
        }

        guard let index = coordinator.parentCoordinators.index(for: self) else {
            return
        }

        let coordinator = coordinator.childTree[index]
        removeChild(coordinator)
    }
}
