//
//  JDChildCoordinatorProtocolInternal.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

typealias _JDChildCoordinatorClass = NSObject & _JDChildCoordinatorProtocol

protocol _JDChildCoordinatorProtocol: JDChildCoordinatorProtocol {
    var parentCoordinator: JDParentCoordinatorProtocol! { get set }
}

extension _JDChildCoordinatorProtocol {

    public func setParent(to coordinator: JDParentCoordinatorProtocol) {
        guard parentCoordinator !== coordinator else {
            return
        }

        guard !coordinator.childCoordinators.contains(self) else {
            return coordinator.addChild(self)
        }

        parentCoordinator = coordinator
    }
}
