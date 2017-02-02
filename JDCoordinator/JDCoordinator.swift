//
//  JDCoordinator.swift
//  insighter
//
//  Created by Jan Dammshäuser on 30.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// JDCoordinators are meant to coordinate one or more ViewControllers
@objc
open class JDCoordinator: NSObject, JDCoordinatorProtocol {
    
    /// Returns direct parentCoordinator
    public internal(set) var parentCoordinator: JDParentCoordinator?
    
    /// Returns every parentCoordinator.
    /// 
    /// .first is .parentCoordinator. .last is uppermost Coordinator in stack (AppCoordinator in a default setup).
    public var parentCoordinators: [JDParentCoordinator] {
        var coords: [JDParentCoordinator] = []
        var coord = self

        while let parent = coord.parentCoordinator {
            coords.append(parent)
            coord = parent
        }

        return coords
    }

    /// This navigationController pushes all ViewControllers
    public var navigationController: UINavigationController {
        return _navigationController
    }

    private unowned let _navigationController: UINavigationController

    /// Initialize the JDCoordinator a UINavigationController
    public init(with navigationController: UINavigationController) {
        _navigationController = navigationController

        super.init()
    }

    /// You need to override this method so it pushes the initial ViewController.
    open func start() {}

    /// You can use this value to save the ViewController which were presented when you started the Coordinator
    public weak var previousViewController: UIViewController?

    /// This method sets navigationController.topViewController to previousViewController
    public func setPreviousViewControllerToCurrent() {
        previousViewController = navigationController.topViewController
    }
}
