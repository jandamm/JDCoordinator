//
//  Child.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Defines childs of coordinators.
public protocol Child: Coordinating, AnyHashableConvertible {
    /// Returns the `parentCoordinator` of this child.
    var parentCoordinator: Parent! { get }

    /// Set the `parentCoordinator` and add it to `parentCoordinators.childCoordinators`.
    ///
    /// You do not have to both `setParent(to:)` and `addChild(:)`
    ///
    /// - parameter coordinator: The new `parentCoordinator`
    func setParent(to coordinator: Parent)
}

public extension Child {
    /// Returns every `parentCoordinator`.
    ///
    /// `.first` is `parentCoordinator`. `.last` is the `AppCoordinator`.
    var parentCoordinators: [Parent] {
        var coordinators: [Parent] = []
        var coordinator: Child? = self

        while let parentCoordinator = coordinator?.parentCoordinator {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator as? Child
        }

        return coordinators
    }

    /// Returns every `parentCoordinator` that is a `Child`.
    ///
    /// `.first` is `self`. `.last` is uppermost parent which is also a child. Which is the `AppCoordinator`s direct childCoordinator.
    internal var parentChildStack: [Child] {
        var coordinators: [Child] = [self]
        var coordinator: Child = self

        while let parentCoordinator = coordinator.parentCoordinator as? Child {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator
        }

        return coordinators
    }
}
