//
//  JDChildCoordinatorStorage.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

// TODO: - This has to be improved before release.
/// Quick and temporary solution to replace the store JDChildCoordinators of an Array with a Set
public struct JDChildCoordinatorStorage {
    private var store: Set<AnyHashable> = []

    mutating func add(_ coordinator: JDChildCoordinatorClass) {
        self.store.insert(coordinator as! AnyHashable)
    }

    mutating func remove(_ coordinator: JDChildCoordinatorClass) {
        store.remove(coordinator as! AnyHashable)
    }

    mutating func removeAll() {
        store.removeAll()
    }
    
    func subtracting(_ coordinators: [JDChildCoordinatorClass]) -> [JDChildCoordinatorClass] {
        let coordinators = Set(coordinators as! [AnyHashable])
        let subtraction = store.subtracting(coordinators)
        
        return Array(subtraction) as! [JDChildCoordinatorClass]
    }

    func contains(_ coordinator: JDChildCoordinatorClass) -> Bool {
        return self.store.contains(coordinator as! AnyHashable)
    }
}
