//
//  JDChildCoordinatorStorage.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

// TODO: - This has to be improved before release.
/// Quick and temporary solution to replace the store JDChildCoordinators of an Array with a Set
public struct JDChildCoordinatorStorage: Collection, ExpressibleByArrayLiteral {
    private var storage: Set<NSObject>

    public init() {
        storage = []
    }

    // MARK: - Sequence
    public typealias Element = JDChildCoordinatorClass

    public func makeIterator() -> AnyIterator<Element> {
        var iterator = storage.makeIterator()
        return AnyIterator {
            iterator.next() as? Element
        }
    }

    // MARK: - Collection
    public typealias Index = Set<NSObject>.Index

    public var startIndex: Index {
        return storage.startIndex
    }

    public var endIndex: Index {
        return storage.endIndex
    }

    public func index(after i: Index) -> Index {
        return storage.index(after: i)
    }

    public subscript(position: Index) -> Element {
        return storage[position] as! JDChildCoordinatorClass
    }

    // MARK: - ExpressibleByArrayLiteral
    public init(arrayLiteral elements: JDChildCoordinatorStorage.Element...) {
        storage = Set(elements as [NSObject])
    }
}

// TODO: - Replace the following stuff
public extension JDChildCoordinatorStorage {

    public mutating func add(_ coordinator: JDChildCoordinatorClass) {
        storage.insert(coordinator as NSObject)
    }

    public mutating func remove(_ coordinator: JDChildCoordinatorClass) {
        storage.remove(coordinator as NSObject)
    }

    public mutating func removeAll() {
        storage.removeAll()
    }

    public func subtracting(_ coordinators: [JDChildCoordinatorClass]) -> [JDChildCoordinatorClass] {
        let coordinators = Set(coordinators as [NSObject])
        let subtraction = storage.subtracting(coordinators)

        return Array(subtraction) as! [JDChildCoordinatorClass] // Only JDCoordinatorClass can be added
    }

    public func contains(_ coordinator: JDChildCoordinatorClass) -> Bool {
        return storage.contains(coordinator as NSObject)
    }
}
