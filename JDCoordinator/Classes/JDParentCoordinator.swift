//
//  JDParentCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// JDParentCoordinators are meant to coordinate one or more JDCoordinators and ViewControllers.
open class JDParentCoordinator: JDCoordinator, _JDParentCoordinatorProtocol, JDCoordinatorCoordinatorDelegate {
    internal(set) public var childCoordinators: [JDChildCoordinatorProtocol] = []
}
