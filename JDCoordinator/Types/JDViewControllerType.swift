//
//  JDViewControllerType.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

/// Defines viewController for JDRootNavigationCoordinatorProtocol and JDNavigationCoordinatorProtocol
///
/// Be aware that not all choices are available for JDRootNavigationCoordinatorProtocol.
/// Every choice that is always available is bold.
/// - **current**: navigationController.topViewController
/// - previous: previousViewController
/// - **visible**: navigationController.visibleViewController
/// - **root**: navigationController.visibleViewController.first
public enum JDViewControllerType {
    case current
    case previous
    case visible
    case root

	/// Calls viewController(for:) on the Coordinator.
    /// - parameter coordinator: The Coordinator whose controller should be returned.
	/// - returns: The viewController for its type.
    public func viewController(from coordinator: JDRootNavigationCoordinatorProtocol) -> UIViewController? {
        return coordinator.viewController(for: self)
    }
}
