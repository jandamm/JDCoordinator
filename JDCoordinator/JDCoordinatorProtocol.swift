//
//  JDCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// Use this protocol for weak pointers to delegates of JDCoordinators in ViewControllers.
@objc
public protocol JDCoordinatorViewControllerDelegate: NSObjectProtocol {
    @objc optional func presentedVC(_ vc: UIViewController, movedTo parent: UIViewController?)
}

/// Use this protocol for weak pointers to delegates of JDParentCoordinators in JDCoordinators.
public typealias JDCoordinatorCoordinatorDelegate = JDParentCoordinatorProtocol

/// Blueprint of JDCoordinators
@objc
public protocol JDCoordinatorProtocol: JDCoordinatorViewControllerDelegate {
    var navigationController: UINavigationController { get }
    var previousViewController: UIViewController? { get }
    func start()
}

/// Blueprint of JDParentCoordinators
@objc
public protocol JDParentCoordinatorProtocol: JDCoordinatorProtocol {
    var childCoordinators: [JDCoordinator] { get }
    func addChildCoordinator(_ coordinator: JDCoordinator)
    func removeChildCoordinator(_ coordinator: JDCoordinator)
}

/// Blueprint of JDSplitViewCoordinatorProtocol
@objc
public protocol JDSplitViewCoordinatorProtocol: JDParentCoordinatorProtocol {
    var splitViewPresenter: UIViewController { get }
    var splitViewController: JDSplitViewController { get }
    var masterCoordinator: JDCoordinator? { get }

    var masterNavigationController: UINavigationController! { get }
    func setMasterNavigationController(_ vc: UINavigationController, withMasterCoordinator masterCoord: JDCoordinator?, andStart start: Bool)

    var detailNavigationController: UINavigationController! { get }
    func showDetailNavigationController(_ vc: UINavigationController, withDetailCoordinator coord: JDCoordinator?, andStart start: Bool, fromSender sender: Any?)
}

public extension JDCoordinatorProtocol {

    /// Convenience method to pushViewController directly within JDCoordinators navigationController
    public func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    /// Convenience method to popViewController directly within JDCoordinators navigationController
    @discardableResult public func popViewController(animated: Bool = true) -> UIViewController? {
        return navigationController.popViewController(animated: animated)
    }

    /// Convenience method to popToViewController directly within JDCoordinators navigationController
    @discardableResult public func popToViewController(_ viewController: UIViewController, animated: Bool = true) -> [UIViewController]? {
        return navigationController.popToViewController(viewController, animated: animated)
    }

    /// Convenience method to popToRootViewController directly within JDCoordinators navigationController
    @discardableResult public func popToRootViewController(animated: Bool = true) -> [UIViewController]? {
        return navigationController.popToRootViewController(animated: animated)
    }

    /// Convenience method to setViewControllers directly within JDCoordinators navigationController
    public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        navigationController.setViewControllers(viewControllers, animated: animated)
    }

    /// Convenience method to setViewControllers directly within JDCoordinators navigationController with only one ViewController
    public func setViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.setViewControllers([viewController], animated: animated)
    }

    /// Convenience method to present directly within JDCoordinators navigationController
    public func present(_ viewControllerToPresent: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.present(viewControllerToPresent, animated: animated, completion: completion)
    }

    /// Convenience method to dismiss directly within JDCoordinators navigationController
    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }

    public func replaceViewControllersAfterPrevious(withNewViewController newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(after: previousViewController, withNewViewController: newVC, animated: animated)
    }

    public func replaceCurrentViewController(withNewViewController newVC: UIViewController, animated: Bool = true) {
        navigationController.replaceCurrentViewController(withNewViewController: newVC, animated: animated)
    }

    public func replaceViewController(_ vc: UIViewController?, withNewViewController newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewController(vc, withNewViewController: newVC, animated: animated)
    }

    public func replaceViewControllers(last count: Int, withNewViewController newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(last: count, withNewViewController: newVC, animated: animated)
    }

    public func replaceViewControllers(after vc: UIViewController?, withNewViewController newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(after: vc, withNewViewController: newVC, animated: animated)
    }

    public func replaceViewControllers(_ vcs: [UIViewController?], withNewViewController newVC: UIViewController? = nil, animated: Bool = true) {
        navigationController.replaceViewControllers(vcs, withNewViewController: newVC, animated: animated)
    }
}
