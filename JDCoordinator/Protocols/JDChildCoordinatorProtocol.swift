//
//  JDChildCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

public protocol JDChildCoordinatorProtocol: JDBaseCoordinatorProtocol {
    /// Returns direct parentCoordinator
    var parentCoordinator: JDParentCoordinatorProtocol! { get }

    /// Returns every parentCoordinator.
    ///
    /// .first is .parentCoordinator. .last is uppermost ChildCoordinator in stack (AppCoordinator in a default setup).
    var parentCoordinators: [JDParentCoordinatorProtocol] { get }

    /// Returns every parentCoordinator that is a JDChildCoordinator.
    ///
    /// .first is .parentCoordinator. .last is uppermost ParentCoordinator in stack. Which should be the AppCoordinators childCoordinator.
    var childStack: [JDChildCoordinatorProtocol] { get }

    func setParent(to coordinator: JDParentCoordinatorProtocol)
}

protocol _JDChildCoordinatorProtocol: JDChildCoordinatorProtocol {
    var parentCoordinator: JDParentCoordinatorProtocol! { get set }
}

extension _JDChildCoordinatorProtocol {

    public func setParent(to coordinator: JDParentCoordinatorProtocol) {
        guard let _ = coordinator.childCoordinators.index(where: { $0 === self }) else {
            return
        }
        parentCoordinator?.removeChild(self)
        parentCoordinator = coordinator
    }
}

public extension JDChildCoordinatorProtocol {

    /// Returns every parentCoordinator.
    ///
    /// .first is .parentCoordinator. .last is uppermost ParentCoordinator in stack. Which should be a JDAppCoordinator.
    var parentCoordinators: [JDParentCoordinatorProtocol] {
        var coords: [JDParentCoordinatorProtocol] = []
        var coord: JDChildCoordinatorProtocol? = self

        while let parent = coord?.parentCoordinator {
            coords.append(parent)
            coord = parent as? JDChildCoordinatorProtocol
        }

        return coords
    }

    /// Returns every parentCoordinator that is a JDChildCoordinator.
    ///
    /// .first is .parentCoordinator. .last is uppermost ParentCoordinator in stack. Which should be the AppCoordinators childCoordinator.
    var childStack: [JDChildCoordinatorProtocol] {
        var coords: [JDChildCoordinatorProtocol] = []
        var coord: JDChildCoordinatorProtocol = self

        while let parent = coord.parentCoordinator as? JDChildCoordinatorProtocol {
            coords.append(parent)
            coord = parent
        }

        return coords
    }
}
