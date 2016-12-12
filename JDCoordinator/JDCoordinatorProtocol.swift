//
//  JDCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// Use this protocol for weak delegates of JDCoordinators to ViewControllers and other JDCoordinators.
public typealias JDCoordinatorDelegate = JDCoordinatorProtocol

/// Blueprint of JDCoordinators
@objc
public protocol JDCoordinatorProtocol: NSObjectProtocol {
	var navigationController: UINavigationController { get }
	init(withNavigationController navigationController: UINavigationController)
	func start()
}

/// Blueprint of JDParentCoordinators
@objc
public protocol JDParentCoordinatorProtocol: JDCoordinatorProtocol {
    var childCoordinator: [JDCoordinator] { get }
    func addChildCoordinator(_ coordinator: JDCoordinator)
    func removeChildCoordinator(_ coordinator: JDCoordinator)
    func removeAllChildCoordinator()
}

public extension JDCoordinatorProtocol {

	/// Convenience method to pushViewController directly within JDCoordinator
	public func pushViewController(_ viewController: UIViewController, animated: Bool) {
		navigationController.pushViewController(viewController, animated: animated)
	}

	/// Convenience method to popViewController directly within JDCoordinator
	public func popViewController(animated: Bool) -> UIViewController? {
		return navigationController.popViewController(animated: animated)
	}

	/// Convenience method to popToViewController directly within JDCoordinator
	public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
		return navigationController.popToViewController(viewController, animated: animated)
	}

	/// Convenience method to popToRootViewController directly within JDCoordinator
	public func popToRootViewController(animated: Bool) -> [UIViewController]? {
		return navigationController.popToRootViewController(animated: animated)
	}

	/// Convenience method to setViewControllers directly within JDCoordinator
	public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
		navigationController.setViewControllers(viewControllers, animated: animated)
	}

	/// Convenience method to setViewControllers directly within JDCoordinator with only one ViewController
	public func setViewControllers(_ viewController: UIViewController, animated: Bool) {
		navigationController.setViewControllers([viewController], animated: animated)
	}

    /// Convenience method to present directly within JDCoordinator
    public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        navigationController.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    /// Convenience method to dismiss directly within JDCoordinator
    func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: flag, completion: completion)
    }
}
