//
//  JDChildCoordinatorStorage.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

public protocol ChildStoring: Collection where Element == Child {}

// TODO: - This has to be improved before release.
/// Quick and temporary solution to replace the store JDChildCoordinators of an Array with a Set
public struct ChildStorage: ChildStoring, SetAlgebra, Equatable, ExpressibleByArrayLiteral {

    // MARK: - Internal Storage

    public typealias Storage = Set<AnyHashable>

    private var storage: Storage

    // MARK: - Initializers

    public init() {
        storage = []
    }

    private init(elements: [Element]) {
        storage = elements.reduce(into: []) { storage, element in
            storage.insert(element.anyHashable)
        }
    }

    private init(storage: Storage) {
        self.storage = storage
    }

    // MARK: - Sequence

    public typealias Element = Child

    // MARK: - Collection

    public typealias Index = Storage.Index

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
        return storage[position].element
    }

    // MARK: - ExpressibleByArrayLiteral

    public init(arrayLiteral elements: Element...) {
        self.init(elements: elements)
    }

    // MARK: - Equatable

    public static func == (lhs: ChildStorage, rhs: ChildStorage) -> Bool {
        return lhs.storage == rhs.storage
    }

    // MARK: - SetAlgebra

    public var isEmpty: Bool {
        return storage.isEmpty
    }

    public func symmetricDifference(_ other: ChildStorage) -> ChildStorage {
        let difference = storage.symmetricDifference(other.storage)
        return ChildStorage(storage: difference)
    }

    @discardableResult
    public mutating func update(with newMember: Element) -> Element? {
        return storage.update(with: newMember.anyHashable)?.element
    }

    public mutating func formUnion(_ other: ChildStorage) {
        storage.formUnion(other.storage)
    }

    public mutating func formIntersection(_ other: ChildStorage) {
        storage.formIntersection(other.storage)
    }

    public mutating func formSymmetricDifference(_ other: ChildStorage) {
        storage.formSymmetricDifference(other.storage)
    }

    public func contains(_ element: Element) -> Bool {
        return storage.contains(element.anyHashable)
    }

    @discardableResult
    public mutating func remove(_ member: Element) -> Element? {
        return storage.remove(member.anyHashable)?.element
    }

    @discardableResult
    public mutating func insert(_ newMember: Element) -> (inserted: Bool, memberAfterInsert: Element) {
        let (inserted, memberAfterInsert) = storage.insert(newMember.anyHashable)
        return (inserted, memberAfterInsert.element)
    }

    public func union(_ other: ChildStorage) -> ChildStorage {
        let union = storage.union(other.storage)
        return ChildStorage(storage: union)
    }

    public func intersection(_ other: ChildStorage) -> ChildStorage {
        let intersection = storage.intersection(other.storage)
        return ChildStorage(storage: intersection)
    }
}

public extension ChildStorage {
    mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
        storage.removeAll(keepingCapacity: keepCapacity)
    }

    func subtracting(_ coordinators: [Element]) -> ChildStorage {
        let other = ChildStorage(elements: coordinators)

        return subtracting(other)
    }
}

private extension AnyHashable {
    var element: Child {
        return base as! Child
    }
}
