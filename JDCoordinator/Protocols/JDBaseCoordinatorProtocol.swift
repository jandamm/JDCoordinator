//
//  JDBaseCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Use this protocol for weak pointers to delegates of JDCoordinators in ViewControllers.
@objc public protocol JDCoordinatorViewControllerDelegate: class {
    @objc optional func presentedVC(_ vc: UIViewController, movedTo parent: UIViewController?)
}

/// Use this protocol for weak pointers to delegates of JDParentCoordinators in JDCoordinators.
public protocol JDCoordinatorCoordinatorDelegate: class {}

public protocol JDBaseCoordinatorProtocol: class {
    /// You need to override this method so it pushes the initial ViewController.
    func start()
}
