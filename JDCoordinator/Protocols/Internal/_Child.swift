//
//  _JDChildCoordinating.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

protocol _Child: Child {
    var parentCoordinator: Parent! { get set }
}

extension _Child {
    public func setParent(to coordinator: Parent) {
        guard parentCoordinator !== coordinator else {
            return
        }

        if !coordinator.hasChild(self) {
            return coordinator.addChild(self)
        }

        parentCoordinator = coordinator
    }
}
