//
//  JDNavigationCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Defines viewController for JDRootNavigationCoordinatorProtocol and JDNavigationCoordinatorProtocol
///
/// Be aware that not all choices are available for JDRootNavigationCoordinatorProtocol.
/// Every choice that is always available is bold.
/// - **current**: navigationController.topViewController
/// - previous: previousViewController
/// - **visible**: navigationController.visibleViewController
public enum JDViewControllerType {
    case current
    case previous
    case visible
    case root

    /// Returns the viewController for its type.
    /// - parameter coordinator: The Coordinator whose controller should be returned.
    public func viewController(for coordinator: JDRootNavigationCoordinatorProtocol) -> UIViewController? {
        switch self {
        case .current: return coordinator.navigationController.topViewController
        case .previous: return (coordinator as? JDNavigationCoordinatorProtocol)?.previousViewController
        case .visible: return coordinator.navigationController.visibleViewController
        case .root: return coordinator.navigationController.viewControllers.first
        }
    }
}

/// A Coordinator that has a navigationController
public protocol JDRootNavigationCoordinatorProtocol: JDBaseCoordinatorProtocol {

    /// The navigationController that is used for every further navigation.
    var navigationController: UINavigationController { get }
}

/// A Coordinator that has a navigationController and wasn't the first Coordinator in stack.
public protocol JDNavigationCoordinatorProtocol: JDRootNavigationCoordinatorProtocol {

    /// You can use this value to save the ViewController where you want to return to when this coordinator is done.
    var previousViewController: UIViewController? { get set }
}

public extension JDNavigationCoordinatorProtocol {

    /// This method sets previousViewController to navigationController.topViewController
    func setPreviousViewControllerToCurrent() {
        previousViewController = navigationController.topViewController
    }
}

public extension JDRootNavigationCoordinatorProtocol {

    /// Removes the given ViewController and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - type: Type of ViewController that will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewController(_ type: JDViewControllerType, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        let vc = type.viewController(for: self)
        replaceViewController(vc, withNew: newViewController, animated: animated)
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
        let vc = type.viewController(for: self)
        replaceViewControllers(after: vc, withNew: newViewController, animated: animated)
    }

    // MARK: - Default Methods
    /// Convenience method to pushViewController directly within JDCoordinators navigationController
    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    /// Convenience method to popViewController directly within JDCoordinators navigationController
    @discardableResult func popViewController(animated: Bool = true) -> UIViewController? {
        return navigationController.popViewController(animated: animated)
    }

    /// Convenience method to popToViewController directly within JDCoordinators navigationController
    @discardableResult func popToViewController(_ viewController: UIViewController, animated: Bool = true) -> [UIViewController]? {
        return navigationController.popToViewController(viewController, animated: animated)
    }

    /// Convenience method to popToRootViewController directly within JDCoordinators navigationController
    @discardableResult func popToRootViewController(animated: Bool = true) -> [UIViewController]? {
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
