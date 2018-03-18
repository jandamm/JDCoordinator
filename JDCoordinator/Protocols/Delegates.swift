//
//  Delegates.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Use this protocol for weak pointers to delegates of JDCoordinators in ViewControllers.
public protocol ControllerDelegate: Coordinating {
    /// Call this method in your ViewController to tell the Coordinator that its state has changed.
    ///
    /// You may want to check if parent == nil and remove the coordinator from it's parent.
    ///
    /// Implement it into UIViewController.didMove(to:)
    ///
    /// - parameters:
    ///     - viewController: self / presented ViewController
    ///     - parentViewController: The parent given by didMove(toParentViewController:)
    func presentedViewController(_ viewController: UIViewController, didMoveTo parentViewController: UIViewController?)

    /// Call this method in your ViewController to tell the Coordinator that its state will changed.
    ///
    /// You may want to check if parent == nil and remove the coordinator from it's parent.
    ///
    /// Implement it into UIViewController.willMove(to:)
    ///
    /// - parameters:
    ///     - viewController: self / presented ViewController
    ///     - parentViewController: The parent given by willMove(toParentViewController:)
    func presentedViewController(_ viewController: UIViewController, willMoveTo parentViewController: UIViewController?)
}

/// Use this protocol for weak pointers to delegates of JDParentCoordinators in JDCoordinators.
///
/// You only need to implement a delegate if you have to return values from the childCoordinator or execute an action if the child is removed.
/// Otherwise use its parentCoordinator.
public protocol CoordinatorDelegate: Coordinating {}
