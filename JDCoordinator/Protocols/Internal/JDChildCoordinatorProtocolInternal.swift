//
//  JDChildCoordinatorProtocolInternal.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

typealias _JDChildCoordinatorClass = NSObject & _JDChildCoordinatorProtocol

protocol _JDChildCoordinatorProtocol: JDChildCoordinatorProtocol {
    var parentCoordinator: JDParentCoordinatorClass! { get set }
}

extension _JDChildCoordinatorProtocol {

    public func setParent(to coordinator: JDParentCoordinatorClass) {
        guard let selfClass = self as? JDChildCoordinatorClass, parentCoordinator !== coordinator else {
            return
        }

        guard !coordinator.childCoordinators.contains(selfClass) else {
            return coordinator.addChild(selfClass)
        }

        parentCoordinator = coordinator
    }
}
