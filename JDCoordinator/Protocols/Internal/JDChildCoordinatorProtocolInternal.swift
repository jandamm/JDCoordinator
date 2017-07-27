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
        guard parentCoordinator !== coordinator else {
            return
        }

        guard !coordinator.childCoordinators.contains( where: { self === $0 }) else {
            return coordinator.addChild(self as! _JDChildCoordinatorClass) // Unsafe unwrapping as _JDChildCoordinatorProtocol can only be used internally
        }

        parentCoordinator = coordinator
    }
}
