//
//  JDSplitViewController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 19.12.2016.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

public class JDSplitViewController: UISplitViewController {

    public weak var coordinator: JDCoordinatorViewControllerDelegate?

    override public func didMove(toParentViewController parent: UIViewController?) {
        coordinator?.presentedVC?(self, movedTo: parent)
    }
}
