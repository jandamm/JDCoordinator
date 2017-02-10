//
//  JDParentCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/**
 Use the ParentCoordinator only in a NavigationController based application.

 The coordinator structure in your app can be seen as a tree. In this example the ParentCoordinator is a branch between the root and a leave.
 A ParentCoordinator can manage other Coordinators as childs and also manage ViewControllers. It is totally safe to add another ParentCoordinator as a child.
 */
open class JDParentCoordinator: JDCoordinator, _JDParentCoordinatorProtocol, JDCoordinatorCoordinatorDelegate {
    internal(set) public var childCoordinators: [JDChildCoordinatorProtocol] = []
}
