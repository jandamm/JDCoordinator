//
//  JDChildCoordinating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Defines Coordinators which can be children to other coordinators.
public protocol JDChildCoordinating: JDBaseCoordinating {
    /// Returns the parentCoordinator of this child.
    var parentCoordinator: JDParentCoordinating! { get }

    /// Set the parentCoordinator and add it to parentCoordinators childCoordinators.
    ///
    /// You do not have to both setParent(to:) and addChild(:)
    ///
    /// - parameter coordinator: The new parentCoordinator
    func setParent(to coordinator: JDParentCoordinating)
}

public extension JDChildCoordinating {
    /// Returns every parentCoordinator.
    ///
    /// .first is .parentCoordinator. .last is the AppCoordinator.
    var parentCoordinators: [JDParentCoordinating] {
        var coordinators: [JDParentCoordinating] = []
        var coordinator: JDChildCoordinating? = self

        while let parentCoordinator = coordinator?.parentCoordinator {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator as? JDChildCoordinating
        }

        return coordinators
    }

    /// Returns every parentCoordinator that is a JDChildCoordinator.
    ///
    /// .first is self. .last is uppermost parent which is also a child. Which is the AppCoordinators direct childCoordinator.
    internal var childStack: [JDChildCoordinating] {
        var coordinators: [JDChildCoordinating] = [self]
        var coordinator: JDChildCoordinating = self

        while let parentCoordinator = coordinator.parentCoordinator as? JDChildCoordinating {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator
        }

        return coordinators
    }
}
