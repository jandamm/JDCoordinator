//
//  Coordinating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Defines Coordinators.
public protocol Coordinating: AnyObject {
    /// You need to override this method so it pushes the initial `UIViewController`.
    /// You can also load data in this method.
    func start()
}
