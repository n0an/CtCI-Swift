//
//  BitManipulation.swift
//  CtCI Tasks
//
//  Created by nag on 24/04/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

// Questions - 127
// Solutions - 288

import Foundation

class BitManipulation {
    
    func getBit(num: Int, i: Int) -> Bool {
        return num & (1 << i) != 0
    }
    
    func setBit(num: Int, i: Int) -> Int {
        return num | (1 << i)
    }
    
    func clearBit(num: Int, i: Int) -> Int {
        let mask = ~(1 << i)
        return num & mask
    }
    
    func clearBitsMSBthroughI(num: Int, i: Int) -> Int {
        let mask = (1 << i) - 1
        return num & mask
    }
    
    func clearBitsIthrough0(num: Int, i: Int) -> Int {
        let mask = (-1 << (i + 1))
        return num & mask
    }
    
    func updateBit(num: Int, i: Int, bitIs1: Bool) -> Int {
        let value = bitIs1 ? 1 : 0
        let mask = ~(1 << i)
        return (num & mask) | (value << i)
    }
    
    // ----------------------------
    // * 5.1. Insertion
    static func updateBits(n: Int, m: Int, i: Int, j: Int) -> Int {
        let allOnes = ~0
        
        let left = allOnes << (j + 1)
        
        let right = ((1 << i) - 1)
        
        let mask = left | right
        
        let n_cleared = n & mask
        let m_shifted = m << i
        
        return n_cleared | m_shifted
    }
    
}
