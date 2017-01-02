//
//  JDNavigationController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.10.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// UINavigationController with where you can en/disable pop to swipe gestures.
open class JDNavigationController: UINavigationController {

    /// Swipe back gestures state
    public var isSwipeBackEnabled: Bool {
        return interactivePopGestureRecognizer?.isEnabled ?? false
    }

    /// Disables swipe back gestures.
    public func disableSwipeBack() {
        interactivePopGestureRecognizer?.isEnabled = false
    }

    /// Enables swipe back gestures
    public func enableSwipeBack() {
        interactivePopGestureRecognizer?.isEnabled = true
    }

    /// Toggles swipe back gestures and returns previous state
    @discardableResult public func toggleSwipeBack() -> Bool {
        interactivePopGestureRecognizer?.isEnabled = !isSwipeBackEnabled
        return isSwipeBackEnabled
    }
}
