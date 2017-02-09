//
//  JDNavigationCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Defines viewController for JDNavigationCoordinatorProtocol
/// - current: navigationController.topViewController
/// - previous: previousViewController
/// - visible: navigationController.visibleViewController
public enum JDViewControllerType {
    case current
    case previous
    case visible

    func vc(for coord: JDNavigationCoordinatorProtocol) -> UIViewController? {
        switch self {
        case .current: return coord.navigationController.topViewController
        case .previous: return coord.previousViewController
        case .visible: return coord.navigationController.visibleViewController
        }
    }
}

/// A Coordinator that has a navigationController
public protocol JDRootNavigationCoordinatorProtocol: JDBaseCoordinatorProtocol {

    /// This navigationController pushes all ViewControllers
    var navigationController: UINavigationController { get }
}

/// A Coordinator that has a navigationController and wasn't the first Coordinator in stack.
public protocol JDNavigationCoordinatorProtocol: JDRootNavigationCoordinatorProtocol {

    /// You can use this value to save the ViewController which were presented when you started the Coordinator
    var previousViewController: UIViewController? { get set }
}

public extension JDNavigationCoordinatorProtocol {

    /// This method sets navigationController.topViewController to previousViewController
    func setPreviousViewControllerToCurrent() {
        previousViewController = navigationController.topViewController
    }

    /// Removes all ViewControllers newer than the given one and pushes to newViewController. Pops if no newViewController is given.
    ///
    /// If no newViewController and no replaceVCs are given or replaceVC is on top of stack it does nothing
    func replaceViewControllers(after type: JDViewControllerType, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        let vc = type.vc(for: self)
        navigationController.replaceViewControllers(after: vc, withNew: newViewController, animated: animated)
    }

    /// Use method to replace the given UIViewController, nil will pushViewController
    func replaceViewController(_ type: JDViewControllerType, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        let vc = type.vc(for: self)
        navigationController.replaceViewController(vc, withNew: newViewController, animated: animated)
    }
}

public extension JDRootNavigationCoordinatorProtocol {

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

    /// Use method to replace the given UIViewController, nil will pushViewController
    func replaceViewController(_ vc: UIViewController?, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewController(vc, withNew: newViewController, animated: animated)
    }

    /// Use method to replace UINavigationControllers last x topViewController
    func replaceViewControllers(last count: Int, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(last: count, withNew: newViewController, animated: animated)
    }

    /// Use method to replace the given Array of UIViewController, nil will pushViewController
    func replaceViewControllers(_ vcs: [UIViewController?], withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(vcs, withNew: newViewController, animated: animated)
    }

    /// Removes all ViewControllers newer than the given one and pushes to newViewController. Pops if no newViewController is given.
    ///
    /// If no newViewController and no replaceVCs are given or replaceVC is on top of stack it does nothing
    func replaceViewControllers(after vc: UIViewController?, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(after: vc, withNew: newViewController, animated: animated)
    }

    /// Removes the given and all newer ViewControllers and pushes to newViewController. Pops if no newViewController is given.
    ///
    /// If no newViewController and no replaceVCs are given or replaceVC is on top of stack it does nothing
    func replaceViewControllers(afterAndIncluding vc: UIViewController?, withNew newViewController: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(afterAndIncluding: vc, withNew: newViewController, animated: animated)
    }
}
