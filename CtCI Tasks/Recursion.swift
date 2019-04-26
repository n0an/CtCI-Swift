//
//  Recursion.swift
//  CtCI Tasks
//
//  Created by nag on 26/04/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

// Questions - 142
// Solutions - 354

import Foundation

class Recursion {
    
    // ----------------------------
    // * 8.1. Triple Step
    // Solution1. Brute force O(3^n)
    static func countWays1(n: Int) -> Int {
        if n < 0 {
            return 0
        } else if n == 0 {
            return 1
        }
        
        return countWays1(n: n - 1) + countWays1(n: n - 2) + countWays1(n: n - 3)
    }
    
    // Solution2. Memoization
    static func countWays2(n: Int) -> Int {
        var memo = Array.init(repeating: -1, count: n + 1)
        return countWays2(n: n, memo: &memo)
    }
    
    static func countWays2(n: Int, memo: inout [Int]) -> Int {
        if n < 0 {
            return 0
        } else if n == 0 {
            return 1
        } else if memo[n] > -1 {
            return memo[n]
        } else {
            memo[n] = countWays2(n: n - 1, memo: &memo) + countWays2(n: n - 2, memo: &memo) + countWays2(n: n - 3, memo: &memo)
            return memo[n]
        }
    }
}
