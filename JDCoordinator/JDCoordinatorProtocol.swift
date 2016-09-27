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
}
