//
//  JDChildCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

public typealias JDChildCoordinatorClass = NSObject & JDChildCoordinatorProtocol

/// Defines Coordinators which can be children to other coordinators.
public protocol JDChildCoordinatorProtocol: JDBaseCoordinatorProtocol {

    /// Returns the parentCoordinator of this child.
    var parentCoordinator: JDParentCoordinatorProtocol! { get }

    /// Set the parentCoordinator and add it to parentCoordinators childCoordinators.
    ///
    /// You do not have to both setParent(to:) and addChild(:)
    ///
    /// - parameter coordinator: The new parentCoordinator
    func setParent(to coordinator: JDParentCoordinatorProtocol)
}

public extension JDChildCoordinatorProtocol {

    /// Returns every parentCoordinator.
    ///
    /// .first is .parentCoordinator. .last is the AppCoordinator.
    var parentCoordinators: [JDParentCoordinatorProtocol] {
        var coordinators: [JDParentCoordinatorProtocol] = []
        var coordinator: JDChildCoordinatorProtocol? = self

        while let parentCoordinator = coordinator?.parentCoordinator {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator as? JDChildCoordinatorProtocol
        }

        return coordinators
    }

    /// Returns every parentCoordinator that is a JDChildCoordinator.
    ///
    /// .first is self. .last is uppermost parent which is also a child. Which is the AppCoordinators direct childCoordinator.
    internal var childStack: [JDChildCoordinatorProtocol] {
        var coordinators: [JDChildCoordinatorProtocol] = [self]
        var coordinator: JDChildCoordinatorProtocol = self

        while let parentCoordinator = coordinator.parentCoordinator as? JDChildCoordinatorProtocol {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator
        }

        return coordinators
    }
}
