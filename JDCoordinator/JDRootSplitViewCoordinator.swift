//
//  JDRootSplitViewCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 01.01.17.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// JDRootSplitViewCoordinators are meant to coordinate one or more JDCoordinators and ViewControllers within an UISplitViewController and used as rootViewController.
/// JDRootSplitViewCoordinator will work like JDSplitViewCoordinator but you have to set it as rootViewController and cannot implement it into an UINavigationController.
/// JDRootSplitViewController will crash whenever you try to access the navigationController or splitViewPresenter as they shouldn't be used.
@objc
open class JDRootSplitViewCoordinator: JDSplitViewCoordinator {
    
    private enum Errors: String {
        case navigationController, splitViewPresenter
        
        var message: String {
            return "Don't use the \(self) with a JDRootSplitViewCoordinator.\nUse a JDSplitViewCoordinator instead or check your code."
        }
    }
    
    /// Don't use the navigationController with a JDRootSplitViewCoordinator.
    /// Use a JDSplitViewCoordinator instead or check your code.
    override public var navigationController: UINavigationController {
        fatalError(Errors.navigationController.message)
    }
    
    /// Don't use the splitViewPresenter with a JDRootSplitViewCoordinator.
    /// Use a JDSplitViewCoordinator instead or check your code.
    override public var splitViewPresenter: UIViewController {
        fatalError(Errors.splitViewPresenter.message)
    }
    
    public init() {
        super.init(withNavigationController: UINavigationController())
        _rootSplitViewCoordinator = true
    }
    
    /// Use this convenience init to set a custom SplitViewController
    public convenience init(withSplitViewController splitView: JDSplitViewController) {
        self.init()
        
        _splitViewController = splitView
    }
}
