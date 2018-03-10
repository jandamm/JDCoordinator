//
//  CustomHashable.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

protocol CustomHashable: Hashable {}

extension CustomHashable {
    func calculateHash(for hashables: [AnyHashable?]) -> Int {
        let cleanHashables = hashables.flatMap { $0 }
        return calculateHash(for: cleanHashables)
    }

    func calculateHash(for hashables: [AnyHashable]) -> Int {
        return hashables.enumerated().reduce(0) { (result, value: (shift: Int, hashable: AnyHashable)) -> Int in
            result ^ value.hashable.hashValue << value.shift
        }
    }
}
