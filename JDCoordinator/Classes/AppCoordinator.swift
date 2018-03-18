//
//  AppCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/**
 Use the `AppCoordinator` only in a `UINavigationController` based application.

 The coordinator structure in your app can be seen as a tree. In this example the `AppCoordinator` is the root of every other coordinator.
 In order to prevent a coordinator from beeing deinitialized it has to have a strong reference somewhere.
 The `AppCoordinator` should be referenced by the `AppDelegate`.
 Every other `Coordinator` should be referenced by the `AppCoordinator` or one of its `Child`s.

 Use this class only once in your app. It should be the `Coordinator` where every navigation is started from.
 The `AppCoordinator` has to use the `UINavigationController` which the `AppDelegate` declares as `keyWindow`.
 */
open class AppCoordinator: Coordinating, RootNavigating, _Parent, CoordinatorDelegate, ControllerDelegate, _StartTestable {
    /// Initialize the `AppCoordinator` with a UINavigationController.
    /// - parameter navigationController: `UINavigationController` which is / will be `keyWindow.rootViewController`
    public init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Protocols

    public internal(set) var childCoordinators = ChildStorage()
    public let navigationController: UINavigationController
    open func start() {
        started()
    }

    open func presentedViewController(_: UIViewController, didMoveTo _: UIViewController?) {}
    open func presentedViewController(_: UIViewController, willMoveTo _: UIViewController?) {}

    var startedCount = 0
}
