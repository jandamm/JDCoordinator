//
//  JDBasicNavController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.10.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// UINavigationController with disabled pop to swipe gestures.
/// The NavigationBar is hidden.
/// Use disableSwipeBack() and enableSwipeBack() or toggleSwipeBack()
open class JDBasicNavController: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationController()
    }

    private func setupNavigationController() {
        setNavigationBarHidden(true, animated: false)

        disableSwipeBack()
    }

    /// returns swipe gestures state
    public var isSwipeBackEnabled: Bool {
        return interactivePopGestureRecognizer?.isEnabled ?? false
    }

    /// disables swipe gestures
    public func disableSwipeBack() {
        interactivePopGestureRecognizer?.isEnabled = false
    }

    /// enables swipe gestures
    public func enableSwipeBack() {
        interactivePopGestureRecognizer?.isEnabled = true
    }

    /// toggles swipe gestures and returns previous state
    @discardableResult public func toggleSwipeBack() -> Bool {
        interactivePopGestureRecognizer?.isEnabled = !isSwipeBackEnabled
        return isSwipeBackEnabled
    }
}
