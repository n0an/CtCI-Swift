//
//  StacksAndQueues.swift
//  CtCI_TasksTests
//
//  Created by Anton Novoselov on 17/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import CtCI_Tasks

class StackAndQueues: XCTestCase {
    
    // =====================================
    // ==== Chapter 3. Stack and Queues ====
    // =====================================
    
    override func setUp() {
        super.setUp()
    }
    
    // * 3.1. Three in One
    // * Hints: 2, 12, 38, 58
    func test3_1_threeInOne () {
        
        let multiStack = FixedMultiStack(stackSize: 3)
        
        multiStack.push(stackNum: 0, value: 1)
        multiStack.push(stackNum: 0, value: 2)
        multiStack.push(stackNum: 0, value: 3)
        
        multiStack.push(stackNum: 1, value: 11)
        multiStack.push(stackNum: 1, value: 12)
        multiStack.push(stackNum: 1, value: 13)
        
        multiStack.push(stackNum: 2, value: 21)
        
        XCTAssertEqual(multiStack.peek(stackNum: 1), 13)
        
        XCTAssertEqual(multiStack.pop(stackNum: 0), 3)

    }
    
    
}
