//
//  _JDChildCoordinatoring.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

typealias _JDChildCoordinatorClass = NSObject & _JDChildCoordinating

protocol _JDChildCoordinating: JDChildCoordinating {
    var parentCoordinator: JDParentCoordinatorClass! { get set }
}

extension _JDChildCoordinating {

    public func setParent(to coordinator: JDParentCoordinatorClass) {
        guard let selfClass = self as? JDChildCoordinatorClass, parentCoordinator !== coordinator else {
            return
        }

        guard !coordinator.hasChild(selfClass) else {
            return coordinator.addChild(selfClass)
        }

        parentCoordinator = coordinator
    }
}
