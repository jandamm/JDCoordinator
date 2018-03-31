//
//  UINavigationController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 23.01.2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

extension UINavigationController: Navigator {}

public extension UINavigationController {
    /// Convenience method that will set the given ViewController.
    func setViewController(_ viewController: UIViewController, animated: Bool) {
        setViewControllers([viewController], animated: animated)
    }

    // MARK: - Custom Methods

    /// Removes the given `UIViewController` and pushes to `newViewController`.
    ///
    /// - parameters:
    ///     - viewController: `UIViewController` that will be removed.
    ///     - newViewController: The viewController you want to push to.
    ///     - animated: Whether it should be animated or not.
    func replaceViewController(_ viewController: UIViewController, withNew newViewController: UIViewController, animated: Bool) {
        replaceViewControllers([viewController], withNew: newViewController, animated: animated)
    }

    /// Removes all given `UIViewController`s and pushes to `newViewController`.
    ///
    /// - parameters:
    ///     - viewControllers: `UIViewController`s that will be removed.
    ///     - newViewController: The viewController you want to push to.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(_ viewControllers: [UIViewController], withNew newViewController: UIViewController, animated: Bool) {
        let viewControllers = Set(viewControllers)

        var viewControllerStack = self.viewControllers.compactMap {
            viewControllers.contains($0) ? nil : $0
        }

        viewControllerStack.append(newViewController)

        setViewControllers(viewControllerStack, animated: animated)
    }

    /// Removes the last n `UIViewControllers` and pushes to newViewController.
    ///
    /// - parameters:
    ///     - count: Number of viewControllers that will be removed. Clamped to be in bounds.
    ///     - newViewController: The viewController you want to push to.
    ///     - animated: Whether it should be animated or not.
    func replaceLastViewControllers(count: Int, withNew newViewController: UIViewController, animated: Bool) {
        let count = count.clamped(to: 0...viewControllers.count)

        let replacing = Array(viewControllers.reversed().prefix(upTo: count))

        replaceViewControllers(replacing, withNew: newViewController, animated: animated)
    }
}
