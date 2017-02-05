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
    var parentCoordinator: JDParentCoordinatorProtocol? { get }

    /// Returns every parentCoordinator.
    ///
    /// .first is .parentCoordinator. .last is uppermost ChildCoordinator in stack (AppCoordinator in a default setup).
    var parentStack: [JDChildCoordinatorProtocol] { get }
}

protocol JDChildCoordinatorProtocolHelper: JDChildCoordinatorProtocol {
    var parentCoordinator: JDParentCoordinatorProtocol? { get set }
}

public extension JDChildCoordinatorProtocol {

    /// Returns every parentCoordinator.
    ///
    /// .first is .parentCoordinator. .last is uppermost ChildCoordinator in stack.
    public var parentStack: [JDChildCoordinatorProtocol] {
        var coords: [JDChildCoordinatorProtocol] = []
        var coord: JDChildCoordinatorProtocol? = self

        while let parent = coord?.parentCoordinator as? JDChildCoordinatorProtocol {
            coords.append(parent)
            coord = parent
        }

        return coords
    }
}
