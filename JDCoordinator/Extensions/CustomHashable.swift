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
        return zip(0..<hashables.count, hashables).reduce(0) { (result, value: (index: Int, hashable: AnyHashable)) -> Int in
            let shift = value.index % 2 == 0 ? 1 : -1
            return result ^ value.hashable.hashValue << shift
        }
    }
}
