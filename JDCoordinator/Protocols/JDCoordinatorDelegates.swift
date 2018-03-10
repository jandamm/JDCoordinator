//
//  JDCoordinatorDelegates.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

/// Use this protocol for weak pointers to delegates of JDCoordinators in ViewControllers.
@objc public protocol JDCoordinatorViewControllerDelegate: class {
    /// Call this method in your ViewController to tell the Coordinator that their state has changed.
    ///
    /// You may want to check if parent == nil and remove the coordinator from it's parent.
    ///
    /// Implement it into UIViewController.didMove(to:)
    ///
    /// - parameters:
    ///     - viewController: self / presented ViewController
    ///     - parentViewController: The parent given by didMove(toParentViewController:)
    @objc optional func presentedViewController(_ viewController: UIViewController, didMoveTo parentViewController: UIViewController?)
}

/// Use this protocol for weak pointers to delegates of JDParentCoordinators in JDCoordinators.
///
/// You only need to implement a delegate if you have to return values from the childCoordinator or execute an action if the child is removed.
/// Otherwise use its parentCoordinator.
@objc public protocol JDCoordinatorCoordinatorDelegate: class {}
