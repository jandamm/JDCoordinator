//
//  ChildStorage.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

public protocol ChildStoring: Collection where Element == Child {}

/// Stores `Child`s in a `Set` and returns them type safe.
///
/// It's best used with `Parent` to store `Child`s
public struct ChildStorage: ChildStoring, SetAlgebra, Equatable, ExpressibleByArrayLiteral {
    private(set) var storage: Storage

    init(elements: [Element]) {
        storage = elements.reduce(into: [], addIntoStorage)
    }

    init(storage: Storage) {
        self.storage = storage
    }
}

// MARK: - Implementations

public extension ChildStorage {

    // MARK: - Typealias

    typealias Storage = Set<AnyHashable>

    typealias Index = Storage.Index
    typealias Element = Child

    // MARK: - Initializers

    init() {
        storage = []
    }

    // MARK: - Collection

    var isEmpty: Bool {
        return storage.isEmpty
    }

    var startIndex: Index {
        return storage.startIndex
    }

    var endIndex: Index {
        return storage.endIndex
    }

    func index(after i: Index) -> Index {
        return storage.index(after: i)
    }

    subscript(position: Index) -> Element {
        return storage[position].element
    }

    // MARK: - ExpressibleByArrayLiteral

    init(arrayLiteral elements: Element...) {
        self.init(elements: elements)
    }

    // MARK: - Equatable

    static func == (lhs: ChildStorage, rhs: ChildStorage) -> Bool {
        return lhs.storage == rhs.storage
    }

    // MARK: - SetAlgebra

    func symmetricDifference(_ other: ChildStorage) -> ChildStorage {
        let difference = storage.symmetricDifference(other.storage)
        return ChildStorage(storage: difference)
    }

    @discardableResult
    mutating func update(with newMember: Element) -> Element? {
        return storage.update(with: newMember.anyHashable)?.element
    }

    mutating func formUnion(_ other: ChildStorage) {
        storage.formUnion(other.storage)
    }

    mutating func formIntersection(_ other: ChildStorage) {
        storage.formIntersection(other.storage)
    }

    mutating func formSymmetricDifference(_ other: ChildStorage) {
        storage.formSymmetricDifference(other.storage)
    }

    func contains(_ element: Element) -> Bool {
        return storage.contains(element.anyHashable)
    }

    @discardableResult
    mutating func remove(_ member: Element) -> Element? {
        return storage.remove(member.anyHashable)?.element
    }

    @discardableResult
    mutating func insert(_ newMember: Element) -> (inserted: Bool, memberAfterInsert: Element) {
        let (inserted, memberAfterInsert) = storage.insert(newMember.anyHashable)
        return (inserted, memberAfterInsert.element)
    }

    func union(_ other: ChildStorage) -> ChildStorage {
        let union = storage.union(other.storage)
        return ChildStorage(storage: union)
    }

    func intersection(_ other: ChildStorage) -> ChildStorage {
        let intersection = storage.intersection(other.storage)
        return ChildStorage(storage: intersection)
    }

    // MARK: - Other Methods

    mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
        storage.removeAll(keepingCapacity: keepCapacity)
    }

    func subtracting(_ coordinators: [Element]) -> ChildStorage {
        let coordinators = coordinators.map { $0.anyHashable }
        let newStorage = storage.subtracting(coordinators)

        return ChildStorage(storage: newStorage)
    }
}

private extension AnyHashable {
    var element: Child {
        return base as! Child
    }
}

func addIntoStorage(storage: inout ChildStorage.Storage, element: ChildStorage.Element) {
    storage.insert(element.anyHashable)
}
