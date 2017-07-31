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
    private var store: Set<NSObject> = []

    var count: Int {
        return store.count
    }

    mutating func add(_ coordinator: JDChildCoordinatorClass) {
        store.insert(coordinator as NSObject)
    }

    mutating func remove(_ coordinator: JDChildCoordinatorClass) {
        store.remove(coordinator as NSObject)
    }

    mutating func removeAll() {
        store.removeAll()
    }

    func subtracting(_ coordinators: [JDChildCoordinatorClass]) -> [JDChildCoordinatorClass] {
        let coordinators = Set(coordinators as [NSObject])
        let subtraction = store.subtracting(coordinators)

        return Array(subtraction) as! [JDChildCoordinatorClass] // Only JDCoordinatorClass can be added
    }

    func contains(_ coordinator: JDChildCoordinatorClass) -> Bool {
        return store.contains(coordinator as NSObject)
    }
}
