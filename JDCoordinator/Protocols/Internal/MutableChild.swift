//
//  MutableChild.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

protocol MutableChild: Child {
    var parentCoordinator: Parent? { get set }
}

extension MutableChild {
    public func setParent(to coordinator: Parent) {
        guard parentCoordinator !== coordinator else {
            return
        }

        if !coordinator.hasChild(self) {
            return coordinator.addChild(self)
        }

        parentCoordinator = coordinator
    }

    public func removed(fromParent oldParent: Parent) {
        guard parentCoordinator === oldParent,
            !oldParent.hasChild(self) else { return }
        parentCoordinator = nil
    }
}
