//
//  RecursionTests.swift
//  CtCI_TasksTests
//
//  Created by nag on 26/04/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import XCTest
@testable import CtCI_Tasks

class RecursionTests: XCTestCase {

    func test8_1_1_tripleStep() {
        XCTAssertEqual(Recursion.countWays1(n: 30), 53798080)
    }
    
    func test8_1_2_tripleStep() {
        XCTAssertEqual(Recursion.countWays2(n: 30), 53798080)
    }
}
