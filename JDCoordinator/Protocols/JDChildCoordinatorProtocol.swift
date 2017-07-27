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
    var parentCoordinator: JDParentCoordinatorClass! { get }

    /// Set the parentCoordinator and add it to parentCoordinators childCoordinators.
    ///
    /// You do not have to both setParent(to:) and addChild(:)
    ///
    /// - parameter coordinator: The new parentCoordinator
    func setParent(to coordinator: JDParentCoordinatorClass)
}

public extension JDChildCoordinatorProtocol where Self: NSObject {

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
    internal var childStack: [JDChildCoordinatorClass] {
        var coordinators: [JDChildCoordinatorClass] = [self]
        var coordinator: JDChildCoordinatorClass = self

        while let parentCoordinator = coordinator.parentCoordinator as? JDChildCoordinatorClass {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator
        }

        return coordinators
    }
}
