//
//  JDRootNavigationCoordinating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

/// A Coordinator that has a navigationController
public protocol JDRootNavigationCoordinating: JDBaseCoordinating {
    /// The navigationController that is used for every further navigation.
    var navigationController: UINavigationController { get }

    /// Provides the ViewController for the given type.
    /// This method is called by some methods to replace ViewControllers.
    ///
    /// A default implementation is provided. Overwrite if you need to modify its behavior.
    /// - parameter type: The requested type of ViewController.
    /// - returns: The viewController matching the given type.
    func viewController(for type: JDViewControllerType) -> UIViewController?
}

public extension JDRootNavigationCoordinating {
    /// Provides the ViewController for the given type.
    /// This method is called by some methods to replace ViewControllers.
    ///
    /// A default implementation is provided. Overwrite if you need to modify its behavior.
    /// - parameter type: The requested type of ViewController.
    /// - returns: The viewController matching the given type.
    func viewController(for type: JDViewControllerType) -> UIViewController? {
        switch type {
        case .current:
            return navigationController.topViewController
        case .previous:
            return (self as? JDNavigationCoordinating)?.previousViewController
        case .visible:
            return navigationController.visibleViewController
        case .root:
            return navigationController.viewControllers.first
        }
    }

    /// Removes the given ViewController and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - type: Type of ViewController that will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewController(_ type: JDViewControllerType, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        let viewController = self.viewController(for: type)
        replaceViewController(viewController, withNew: newViewController, animated: animated)
    }

    /// Removes all ViewControllers newer than the given one and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - type: Type of ViewController after which every viewController will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(after type: JDViewControllerType, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        let viewController = self.viewController(for: type)
        replaceViewControllers(after: viewController, withNew: newViewController, animated: animated)
    }

    // MARK: - Default Methods

    /// Convenience method to pushViewController directly within JDCoordinators navigationController
    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    /// Convenience method to popViewController directly within JDCoordinators navigationController
    @discardableResult
func popViewController(animated: Bool = true) -> UIViewController? {
        return navigationController.popViewController(animated: animated)
    }

    /// Convenience method to popToViewController directly within JDCoordinators navigationController
    @discardableResult
func popToViewController(_ viewController: UIViewController, animated: Bool = true) -> [UIViewController]? {
        return navigationController.popToViewController(viewController, animated: animated)
    }

    /// Convenience method to popToRootViewController directly within JDCoordinators navigationController
    @discardableResult
func popToRootViewController(animated: Bool = true) -> [UIViewController]? {
        return navigationController.popToRootViewController(animated: animated)
    }

    /// Convenience method to setViewControllers directly within JDCoordinators navigationController
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        navigationController.setViewControllers(viewControllers, animated: animated)
    }

    /// Convenience method to present directly within JDCoordinators navigationController
    func present(_ viewControllerToPresent: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.present(viewControllerToPresent, animated: animated, completion: completion)
    }

    /// Convenience method to dismiss directly within JDCoordinators navigationController
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }

    // MARK: - Custom Methods

    /// Convenience method to setViewController directly within JDCoordinators navigationController
    func setViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.setViewController(viewController, animated: animated)
    }

    /// Removes the given ViewController and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - viewController: ViewController that will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewController(_ viewController: UIViewController?, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewController(viewController, withNew: newViewController, animated: animated)
    }

    /// Removes all given ViewController and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - viewControllers: ViewControllers that will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(_ viewControllers: [UIViewController?], withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(viewControllers, withNew: newViewController, animated: animated)
    }

    /// Removes all ViewControllers newer than the given one and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - viewController: ViewController after which every viewController will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(after viewController: UIViewController?, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(after: viewController, withNew: newViewController, animated: animated)
    }

    /// Removes all ViewControllers newer and the given one and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - viewController: ViewController that will be removed along with every newer ViewController.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(afterAndIncluding viewController: UIViewController?, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(afterAndIncluding: viewController, withNew: newViewController, animated: animated)
    }

    /// Removes the last n ViewControllers and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - count: Number of viewControllers that will be removed (>0).
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(last count: Int, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(last: count, withNew: newViewController, animated: animated)
    }
}
