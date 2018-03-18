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
/// - current: navigationController.topViewController
/// - previous: previousViewController
/// - root: navigationController.visibleViewController.first
/// - visible: navigationController.visibleViewController
public enum JDViewControllerType {
    case current
    case previous
    case root
    case visible

    /// Calls viewController(for:) on the Coordinator.
    /// - parameter coordinator: The Coordinator whose controller should be returned.
    /// - returns: The viewController for its type.
    public func viewController(from coordinator: RootNavigating) -> UIViewController? {
        return coordinator.viewController(for: self)
    }
}
