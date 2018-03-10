//
//  JDNavigationCoordinating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// A Coordinator that has a navigationController and wasn't the first Coordinator in stack.
public protocol JDNavigationCoordinating: JDRootNavigationCoordinating {
    /// You can use this value to save the ViewController where you want to return to when this coordinator is done.
    var previousViewController: UIViewController? { get set }
}

public extension JDNavigationCoordinating {
    /// This method sets previousViewController to navigationController.topViewController
    func setPreviousViewControllerToCurrent() {
        previousViewController = navigationController.topViewController
    }
}