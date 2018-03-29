//
//  RootNavigating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

/// A Coordinator that has a navigationController.
/// In most cases this is only the AppCoordinator or the Root of each Tab.
public protocol RootNavigating: AnyObject {
    /// The navigationController that is used for every further navigation.
    var navigationController: UINavigationController { get }
}

public extension RootNavigating {
    /// Removes the given ViewController and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - keyPath: Type of ViewController that will be removed. If nil, new will be pushed.
    ///     - newViewController: The viewController you want to push to.
    ///     - animated: Whether it should be animated or not.
    func replaceViewController(_ keyPath: KeyPath<Self, UIViewController?>, withNew newViewController: UIViewController, animated: Bool) {
        guard let viewController = self[keyPath: keyPath] else {
            navigationController.pushViewController(newViewController, animated: animated)
            return
        }
        navigationController.replaceViewController(viewController, withNew: newViewController, animated: animated)
    }
}
