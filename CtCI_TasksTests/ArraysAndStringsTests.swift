//
//  ArraysAndStringsTests.swift
//  CtCI_TasksTests
//
//  Created by Anton Novoselov on 05/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import CtCI_Tasks

class ArraysAndStringsTests: XCTestCase {
    
    func test1_5_isOneAwayEdit() {
        print("------ 1.5. One Away ------")
        
        // * 1.5. One Away
        // * Hints: 23, 97, 130
        
        let str151 = "pale"
        let str152 = "ple"
        
        let str153 = "pales"
        let str154 = "bale"
        let str155 = "bake"
        
        XCTAssertTrue(String.isOneAway(inputStr1: str151, inputStr2: str152), "No one away")
        XCTAssertTrue(String.isOneAway(inputStr1: str153, inputStr2: str151), "No one away")
        XCTAssertTrue(String.isOneAway(inputStr1: str151, inputStr2: str154), "No one away")
        XCTAssertFalse(String.isOneAway(inputStr1: str151, inputStr2: str155), "No one away")

    }
    
}
