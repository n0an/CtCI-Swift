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
