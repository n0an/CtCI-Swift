//
//  BitManipulationTests.swift
//  CtCI_TasksTests
//
//  Created by nag on 24/04/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import XCTest
@testable import CtCI_Tasks

class BitManipulationTests: XCTestCase {

    override func setUp() {
        
    }
    
    // * 5.1. Insertion
    func test5_1_insertion() {
        
        let n = 0b10000000000
        
        let m = 0b10011
        
        let i = 2
        let j = 6
        
        XCTAssertEqual(String(BitManipulation.updateBits(n: n, m: m, i: i, j: j), radix: 2), "10001001100")
        
    }
    

}
