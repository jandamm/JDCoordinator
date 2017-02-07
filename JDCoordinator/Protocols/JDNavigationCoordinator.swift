//
//  JDNavigationCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

public enum JDViewControllerType {
    case current
    case previous

    func vc(for coord: JDNavigationCoordinator) -> UIViewController? {
        switch self {
        case .current: return coord.navigationController.topViewController
        case .previous: return coord.previousViewController
        }
    }
}

public protocol JDRootNavigationCoordinator: JDBaseCoordinatorProtocol {
    /// This navigationController pushes all ViewControllers
    var navigationController: UINavigationController { get }
}

public protocol JDNavigationCoordinator: JDRootNavigationCoordinator {
    /// You can use this value to save the ViewController which were presented when you started the Coordinator
    var previousViewController: UIViewController? { get set }
}

public extension JDNavigationCoordinator {

    /// This method sets navigationController.topViewController to previousViewController
    func setPreviousViewControllerToCurrent() {
        previousViewController = navigationController.topViewController
    }

    func replaceViewControllers(after type: JDViewControllerType, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        let vc = type.vc(for: self)
        navigationController.replaceViewControllers(after: vc, withNew: newVC, animated: animated)
    }

    func replaceViewController(_ type: JDViewControllerType, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        let vc = type.vc(for: self)
        navigationController.replaceViewController(vc, withNew: newVC, animated: animated)
    }
}

public extension JDRootNavigationCoordinator {

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
    func setViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.setViewController(viewController, animated: animated)
    }

    func replaceViewController(_ vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewController(vc, withNew: newVC, animated: animated)
    }

    func replaceViewControllers(last count: Int, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(last: count, withNew: newVC, animated: animated)
    }

    func replaceViewControllers(_ vcs: [UIViewController?], withNew newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(vcs, withNew: newVC, animated: animated)
    }

    func replaceViewControllers(after vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(after: vc, withNew: newVC, animated: animated)
    }

    func replaceViewControllers(afterAndIncluding vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(afterAndIncluding: vc, withNew: newVC, animated: animated)
    }
}
