//
//  Delegates.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Use this protocol for weak pointers to delegates of `Coordinating` in `UIViewControllers`.
public protocol ControllerDelegate: Coordinating {
    /// Call this method in your `UIViewController` to tell the `Coordinating` that its state has changed.
    ///
    /// You may want to check if `parentViewController == nil` and remove the coordinator from it's parent.
    ///
    /// Implement it into `UIViewController.didMove(to:)`
    ///
    /// - parameters:
    ///     - viewController: `self` / presented `UIViewController`
    ///     - parentViewController: The parent given by `didMove(toParentViewController:)`
    func presentedViewController(_ viewController: UIViewController, didMoveTo parentViewController: UIViewController?)

    /// Call this method in your `UIViewController` to tell the `Coordinating` that its state will change.
    ///
    /// You may want to check if `parentViewController == nil` and remove the coordinator from it's parent.
    ///
    /// Implement it into `UIViewController.willMove(to:)`
    ///
    /// - parameters:
    ///     - viewController: `self` / presented `UIViewController`
    ///     - parentViewController: The parent given by `willMove(toParentViewController:)`
    func presentedViewController(_ viewController: UIViewController, willMoveTo parentViewController: UIViewController?)
}

/// Use this protocol for weak pointers to delegates of `Parent`s in `Child`s.
///
/// You only need to implement a delegate if you have to return values from the `Child` or execute an action if the `Child` is removed.
/// Otherwise use its `parentCoordinator`.
public protocol CoordinatorDelegate: Coordinating {}
