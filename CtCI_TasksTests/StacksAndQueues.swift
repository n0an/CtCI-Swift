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
    
    // * 3.2. Stack Min
    // Hints: 27, 59, 78
    func test3_2_stackMin() {
        let stack = StackWithMin<Int>()
        stack.push(item: 7)
        stack.push(item: 10)
        stack.push(item: 14)
        stack.push(item: 2)
        stack.push(item: 62)

        XCTAssertEqual(stack.min(), 2)
        
        _ = stack.pop()
        _ = stack.pop()
        
        XCTAssertEqual(stack.min(), 7)
    }
    
    // * 3.4. Queue via Stacks
    // Hints: 98, 114
    func test3_4_1_queue() {
        
        let queueWithStacks = MyQueueWithStacks<Int>()
        queueWithStacks.enqueue(item: 7)
        queueWithStacks.enqueue(item: 10)
        queueWithStacks.enqueue(item: 14)
        queueWithStacks.enqueue(item: 2)
        queueWithStacks.enqueue(item: 62)
        
        XCTAssertEqual(queueWithStacks.dequeue(), 7)
        XCTAssertEqual(queueWithStacks.dequeue(), 10)
    }
    
    func test3_4_2_queue() {
        
        let queueWithStacks = MyQueueWithStacks2<Int>()
        queueWithStacks.enqueue(item: 7)
        queueWithStacks.enqueue(item: 10)
        queueWithStacks.enqueue(item: 14)
        queueWithStacks.enqueue(item: 2)
        queueWithStacks.enqueue(item: 62)
        
        XCTAssertEqual(queueWithStacks.dequeue(), 7)
        XCTAssertEqual(queueWithStacks.dequeue(), 10)
    }
    
    // * 3.5. Sort Stack
    // Hints: 15, 32, 43
    func test3_5_1_sortStack() {
        
        let stack = MyStack<Int>()
        stack.push(item: 7)
        stack.push(item: 10)
        stack.push(item: 14)
        stack.push(item: 2)
        stack.push(item: 62)
        
        MyStack.sort(stack: stack)
        
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 7)
        XCTAssertEqual(stack.pop(), 10)
        XCTAssertEqual(stack.pop(), 14)
        XCTAssertEqual(stack.pop(), 62)
    }
}













