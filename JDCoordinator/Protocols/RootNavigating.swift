//
//  RootNavigating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

/// A Coordinator that has a navigationController.
/// In most cases this is only the AppCoordinator or the Root of each Tab.
public protocol RootNavigating: Navigator {
    /// The navigationController that is used for every further navigation.
    var navigationController: UINavigationController { get }
}

public extension RootNavigating where Self: Coordinating {
    /// Removes the given ViewController and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - type: Type of ViewController that will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewController(_ keyPath: KeyPath<Self, UIViewController?>, withNew newViewController: UIViewController?, animated: Bool) {
        let viewController = self[keyPath: keyPath]
        navigationController.replaceViewController(viewController, withNew: newViewController, animated: animated)
    }

    /// Removes all ViewControllers newer than the given one and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - type: Type of ViewController after which every viewController will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllersAfter(_ keyPath: KeyPath<Self, UIViewController?>, withNew newViewController: UIViewController?, animated: Bool) {
        let viewController = self[keyPath: keyPath]
        navigationController.replaceViewControllers(after: viewController, withNew: newViewController, animated: animated)
    }
}
