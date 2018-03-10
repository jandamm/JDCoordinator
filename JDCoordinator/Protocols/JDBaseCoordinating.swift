//
//  JDBaseCoordinating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// BaseProtocol where every other CoordinatorProtocol inherits from.
public protocol JDBaseCoordinating: class, AnyHashableConvertible {

    /// You need to override this method so it pushes the initial ViewController.
    /// You can also load data in this method.
    func start()
}
