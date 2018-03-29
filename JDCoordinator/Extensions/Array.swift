//
//  Array.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 26.03.2018.
//  Copyright © 2018 Jan Dammshäuser. All rights reserved.
//

import Foundation

public extension Array where Element == Parent {
    func index(for coordinator: Element) -> Int? {
        return index(where: { $0 === coordinator })
    }

    func contains(_ coordinator: Element) -> Bool {
        return index(for: coordinator) != nil
    }
}

public extension Array where Element == Child {
    func index(for coordinator: Element) -> Int? {
        return index(where: { $0 === coordinator })
    }

    func contains(_ coordinator: Element) -> Bool {
        return index(for: coordinator) != nil
    }
}

extension Array where Element: Comparable & Hashable {
    var noDuplicatesAndSorted: [Element] {
        let array = Array(Set(self))
        return array.sorted(by: <)
    }
}

protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    var value: Wrapped? { return self }
}

extension Sequence where Element: OptionalType {
    var unwrapped: [Element.Wrapped] {
        return flatMap { $0.value }
    }
}
