//
//  JDParentCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit


/// JDParentCoordinator are meant to coordinate one or more JDCoordinators and ViewControllers.
@objc
public class JDParentCoordinator: JDCoordinator {
    
    private var childCoordinator = [JDCoordinator]()
    
    /// Add a JDCoordinator as a child
    public func addChildCoordinator(coordinator: JDCoordinator) {
        childCoordinator.append(coordinator)
    }
    
    /// Remove a child
    public func removeChildCoordinator(coordinator: JDCoordinator) {
        if let index = childCoordinator.indexOf(coordinator) {
            childCoordinator.removeAtIndex(index)
        }
    }
}
