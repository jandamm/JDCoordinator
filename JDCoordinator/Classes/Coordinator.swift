//
//  Coordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 30.08.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

// TODO: - remove NSObject inheritance once Swift 4.1 is released. Using Hashable instead.
#if swift(>=4.1)
    extension Coordinator: Hashable {}
#else
    extension Coordinator: Hashable {
        public static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
            return lhs.uuid == rhs.uuid
        }

        public var hashValue: Int {
            return uuid.hashValue
        }
    }
#endif

/**
 The `Coordinator` is the simplest class in a `UINavigationController` based application.

 The coordinator structure in your app can be seen as a tree. In this example the `Coordinator` is the end of any branch.
 A `Coordinator` can only manage `UIViewController`s and should not instantiate or strongly reference any other coordinator.
 */
open class Coordinator: Coordinating, Navigating, MutableChild, ControllerDelegate, StartTestable {
    let uuid = UUID()
    /// Initialize the `Coordinator` with a `UINavigationController` and adds it to a `parentCoordinator`.
    /// - parameter navigationController: `UINavigationController` where any further navigation should take place.
    /// - parameter parentCoordinator: `ParentCoordinator` that should reference this coordinator.
    public init(with navigationController: UINavigationController, andAddToParent parentCoordinator: Parent) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator

        parentCoordinator.addChild(self)
    }

    /// Initializes the `Coordinator` by calling `init(with:andAddToParent:)` using the `parentCoordinator.navigationController`.
    /// - parameter parentCoordinator: The parent of this Coordinator and the provider of the navigationController.
    public convenience init<ParentCoordinator>(withParent parentCoordinator: ParentCoordinator) where ParentCoordinator: Parent & RootNavigating {
        self.init(with: parentCoordinator.navigationController, andAddToParent: parentCoordinator)
    }

    // MARK: - Protocols

    public internal(set) weak var parentCoordinator: Parent!
    public let navigationController: UINavigationController
    public weak var previousViewController: UIViewController?
    var startedCount: Int = 0

    open func start() {
        started()
    }

    open func presentedViewController(_: UIViewController, didMoveTo _: UIViewController?) {}

    open func presentedViewController(_: UIViewController, willMoveTo _: UIViewController?) {}
}
