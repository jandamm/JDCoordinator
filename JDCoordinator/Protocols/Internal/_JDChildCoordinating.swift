//
//  _JDChildCoordinating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

protocol _JDChildCoordinating: JDChildCoordinating {
    var parentCoordinator: JDParentCoordinating! { get set }
}

extension _JDChildCoordinating {
    public func setParent(to coordinator: JDParentCoordinating) {
        guard parentCoordinator !== coordinator else {
            return
        }

        if !coordinator.hasChild(self) {
            return coordinator.addChild(self)
        }

        parentCoordinator = coordinator
    }
}
