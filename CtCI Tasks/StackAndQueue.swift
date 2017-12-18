//
//  Stack.swift
//  CtCI Tasks
//
//  Created by Anton Novoselov on 15/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class Stack<T: Hashable> where T: Comparable {
    
    var array: [T] = []
    
    init() {
    }
    
    func push(_ item: T) {
        array.append(item)
    }
    
    func pop() -> T? {
        return array.popLast()
    }
}

class MyStack<T> {
    
    private class StackNode<T> {
        var data: T
        var next: StackNode<T>?
        
        init(data: T) {
            self.data = data
        }
    }
    
    private var top: StackNode<T>?
    
    func pop() -> T? {
        if top == nil { return nil }
        
        let item = top!.data
        top = top!.next
        return item
    }
    
    func push(item: T) {
        let t = StackNode<T>(data: item)
        t.next = top
        top = t
    }
    
    func peek() -> T? {
        if top == nil { return nil }
        return top!.data
    }
    
    func isEmpty() -> Bool {
        return top == nil
    }
    
}

class MyQueue<T> {
    private class QueueNode<T> {
        var data: T
        var next: QueueNode<T>?
        
        init(data: T) {
            self.data = data
        }
    }
    
    private var first: QueueNode<T>?
    private var last: QueueNode<T>?
    
    func add(item: T) {
        let t = QueueNode<T>(data: item)
        
        if last != nil {
            last!.next = t
        }
        
        last = t
        
        if first == nil {
            first = last
        }
    }
    
    func remove() -> T? {
        if first == nil { return nil }
        
        let data = first!.data
        
        first = first!.next
        
        if first == nil {
            last = nil
        }
        
        return data
    }
    
    func peek() -> T? {
        if first == nil { return nil }
        return first!.data
    }
    
    func isEmpty() -> Bool {
        return first == nil
    }
}



// * 3.1. Three in ONe
// * Hints: 2, 12, 38, 58
class FixedMultiStack {
    private let numberOfStacks = 3
    private var stackCapacity: Int
    private var values: [Int]
    private var sizes: [Int]
    
    init(stackSize: Int) {
        self.stackCapacity = stackSize
        
        self.values = [Int].init(repeating: 0, count: stackSize * numberOfStacks)
        
        self.sizes = [Int].init(repeating: 0, count: numberOfStacks)
    }
    
    // Push value onto stack
    public func push(stackNum: Int, value: Int) {
        // Check that we have space for the next element
        if isFull(stackNum: stackNum) {
            return
        }
        
        // Increment stack pointer and then update top value
        sizes[stackNum] += 1
        values[indexOfTop(stackNum: stackNum)] = value
    }
    
    // Pop item from top stack
    public func pop(stackNum: Int) -> Int? {
        if isEmpty(stackNum: stackNum) {
            return nil
        }
        
        let topIndex = indexOfTop(stackNum: stackNum)
        let value = values[topIndex] // Get top
        values[topIndex] = 0 // Clear
        sizes[stackNum] -= 1 // Shrink
        return value
    }
    
    // Return top element
    public func peek(stackNum: Int) -> Int? {
        if isEmpty(stackNum: stackNum) { return nil }
        
        return values[indexOfTop(stackNum: stackNum)]
    }
    
    // Return if stack is empty
    public func isEmpty(stackNum: Int) -> Bool {
        return sizes[stackNum] == 0
    }
    
    // Return if stack is full
    public func isFull(stackNum: Int) -> Bool {
        return sizes[stackNum] == stackCapacity
    }
    
    // Returns index of the top of the stack
    private func indexOfTop(stackNum: Int) -> Int {
        let offset = stackNum * stackCapacity
        let size = sizes[stackNum]
        return offset + size - 1
    }
   
}


// * 3.2. Stack Min
// Hints: 27, 59, 78
class StackWithMin<T>: MyStack<T> where T: Comparable {
    var s2: MyStack<T>
    
    override init() {
        s2 = MyStack<T>()
    }
    
    override func push(item: T) {
        
        if s2.isEmpty() {
            s2.push(item: item)
        } else if let min = min(), item < min {
            s2.push(item: item)
        }
        
        super.push(item: item)
    }
    
    override func pop() -> T? {
        guard let value = super.pop() else { return nil }
        
        if let min = min(), value == min {
            _ = s2.pop()
        }
        
        return value
    }
    
    func min() -> T? {
        if s2.isEmpty() {
            return nil
        } else {
            return s2.peek()
        }
    }
}




