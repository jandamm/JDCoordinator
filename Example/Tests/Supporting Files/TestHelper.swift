//
//  TestHelper.swift
//  JDCoordinator_Example
//
//  Created by Jan Dammshäuser on 10.03.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

protocol Asserting {}

extension Asserting {
    static func identical<T: AnyObject & Equatable>(_ first: T?, _ second: T?, file: StaticString = #file, line: UInt = #line) {
        switch (first, second) {
        case let (first?, second?):
            XCTAssertEqual(first, second, file: file, line: line)
            XCTAssertTrue(first === second, file: file, line: line)
        default:
            XCTAssertTrue(first === second, file: file, line: line)
        }
    }
}

struct TestHelper {
}
