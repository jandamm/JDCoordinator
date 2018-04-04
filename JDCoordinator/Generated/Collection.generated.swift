// Generated using Sourcery 0.11.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// Unluckily the type system in Swift still does not allow to be generic on protocols.
// While it is fine to extend a Collection containing objects implementing a protocol,
// you cannot extend a Collection containing objects as this protocol.
// To compensate this I generated this extension with Sourcery.

public extension Collection where Element == Child {
    /// Returns the index of the element in the collection.
    /// - parameter member: An element to look for in the collection.
    /// - returns: members index if member exists in the collection; otherwise, nil.
    func index(of member: Child) -> Index? {
        return index(where: { $0 === member })
    }
}

public extension Sequence where Element == Child {
    /// Returns a Boolean value that indicates whether the given element exists in the sequence.
    /// - parameter member: An element to look for in the sequence.
    /// - returns: true if member exists in the sequence; otherwise, false.
    func contains(_ member: Child) -> Bool {
        return first(where: { $0 === member }) != nil
    }
}

public extension Collection where Element == ControllerDelegate {
    /// Returns the index of the element in the collection.
    /// - parameter member: An element to look for in the collection.
    /// - returns: members index if member exists in the collection; otherwise, nil.
    func index(of member: ControllerDelegate) -> Index? {
        return index(where: { $0 === member })
    }
}

public extension Sequence where Element == ControllerDelegate {
    /// Returns a Boolean value that indicates whether the given element exists in the sequence.
    /// - parameter member: An element to look for in the sequence.
    /// - returns: true if member exists in the sequence; otherwise, false.
    func contains(_ member: ControllerDelegate) -> Bool {
        return first(where: { $0 === member }) != nil
    }
}

public extension Collection where Element == Coordinating {
    /// Returns the index of the element in the collection.
    /// - parameter member: An element to look for in the collection.
    /// - returns: members index if member exists in the collection; otherwise, nil.
    func index(of member: Coordinating) -> Index? {
        return index(where: { $0 === member })
    }
}

public extension Sequence where Element == Coordinating {
    /// Returns a Boolean value that indicates whether the given element exists in the sequence.
    /// - parameter member: An element to look for in the sequence.
    /// - returns: true if member exists in the sequence; otherwise, false.
    func contains(_ member: Coordinating) -> Bool {
        return first(where: { $0 === member }) != nil
    }
}

public extension Collection where Element == CoordinatorDelegate {
    /// Returns the index of the element in the collection.
    /// - parameter member: An element to look for in the collection.
    /// - returns: members index if member exists in the collection; otherwise, nil.
    func index(of member: CoordinatorDelegate) -> Index? {
        return index(where: { $0 === member })
    }
}

public extension Sequence where Element == CoordinatorDelegate {
    /// Returns a Boolean value that indicates whether the given element exists in the sequence.
    /// - parameter member: An element to look for in the sequence.
    /// - returns: true if member exists in the sequence; otherwise, false.
    func contains(_ member: CoordinatorDelegate) -> Bool {
        return first(where: { $0 === member }) != nil
    }
}

public extension Collection where Element == Navigating {
    /// Returns the index of the element in the collection.
    /// - parameter member: An element to look for in the collection.
    /// - returns: members index if member exists in the collection; otherwise, nil.
    func index(of member: Navigating) -> Index? {
        return index(where: { $0 === member })
    }
}

public extension Sequence where Element == Navigating {
    /// Returns a Boolean value that indicates whether the given element exists in the sequence.
    /// - parameter member: An element to look for in the sequence.
    /// - returns: true if member exists in the sequence; otherwise, false.
    func contains(_ member: Navigating) -> Bool {
        return first(where: { $0 === member }) != nil
    }
}

public extension Collection where Element == Parent {
    /// Returns the index of the element in the collection.
    /// - parameter member: An element to look for in the collection.
    /// - returns: members index if member exists in the collection; otherwise, nil.
    func index(of member: Parent) -> Index? {
        return index(where: { $0 === member })
    }
}

public extension Sequence where Element == Parent {
    /// Returns a Boolean value that indicates whether the given element exists in the sequence.
    /// - parameter member: An element to look for in the sequence.
    /// - returns: true if member exists in the sequence; otherwise, false.
    func contains(_ member: Parent) -> Bool {
        return first(where: { $0 === member }) != nil
    }
}

public extension Collection where Element == RootNavigating {
    /// Returns the index of the element in the collection.
    /// - parameter member: An element to look for in the collection.
    /// - returns: members index if member exists in the collection; otherwise, nil.
    func index(of member: RootNavigating) -> Index? {
        return index(where: { $0 === member })
    }
}

public extension Sequence where Element == RootNavigating {
    /// Returns a Boolean value that indicates whether the given element exists in the sequence.
    /// - parameter member: An element to look for in the sequence.
    /// - returns: true if member exists in the sequence; otherwise, false.
    func contains(_ member: RootNavigating) -> Bool {
        return first(where: { $0 === member }) != nil
    }
}
