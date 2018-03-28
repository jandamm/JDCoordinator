//
//  Navigator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 03/26/2018.
//  Copyright © 2018 Jan Dammshäuser. All rights reserved.
//

import Foundation

protocol Navigator: AnyObject {

    // MARK: - Default methods

    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool) -> UIViewController?
    func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]?
    func popToRootViewController(animated: Bool) -> [UIViewController]?
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool)
    func present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)

    // MARK: - Additive methods

    func setViewController(_ viewController: UIViewController, animated: Bool)
    func replaceViewController(_ viewController: UIViewController, withNew newViewController: UIViewController, animated: Bool)
    func replaceViewControllers(_ viewControllers: [UIViewController], withNew newViewController: UIViewController, animated: Bool)
    func replaceLastViewControllers(count: Int, withNew newViewController: UIViewController, animated: Bool)
}
