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
