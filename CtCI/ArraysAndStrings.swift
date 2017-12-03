//
//  ArraysAndStrings.swift
//  CtCI
//
//  Created by Anton Novoselov on 03/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

extension String {
    
    // === Chapter 1. Arrays and Strings
    // * 1.1. Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
    // * Hints: 44, 117, 131

    // Solution 1
    func isStringCharactersUnique1() -> Bool {
        
        guard self.count < 128 && self.count > 0 else { return false }
        guard self.count != 1 else { return true }
        
        let set = Set(self)
        
        return set.count == self.count
    }
    
    // Solution 2
    func isStringCharactersUnique2() -> Bool {
        
        guard self.count < 128 && self.count > 0 else { return false }
        guard self.count != 1 else { return true }
        
        var list = Array<Bool?>(repeatElement(nil, count: 256))
        
        for key in self.unicodeScalars {
            let intKey = Int(key.value)
            
            if list[intKey] != nil {
                return false
            }
            
            list.insert(true, at: Int(key.value))
        }
        
        return true
    }
    
    // Solution 3
    func isStringCharactersUnique3() -> Bool {
        // Without additional data structures
        guard self.count < 128 && self.count > 0 else { return false }
        guard self.count != 1 else { return true }
        
        for char in self.characters {
            var counter = 0
            for ch in self.characters {
                
                if char == ch {
                    counter += 1
                    if counter > 1 {
                        return false
                    }
                }
            }
        }
        
        return true
    }

    // * 1.2. Given two strings, write a method to decide if one is a permutation of the other
    // * Hints: 1, 84, 122, 131

    // Solution 1
    func isStringPermutation1(inputStr: String) -> Bool {
        
        guard self.count == inputStr.count else { return false }
        
        return self.characters.sorted() == inputStr.characters.sorted()
        
    }
    
    // Solution 2
    func isStringPermutation2(inputStr: String) -> Bool {
        
        guard self.count == inputStr.count else { return false }
        
        var letters = Array<Int>(repeating: 0, count: 256)
        
        for uScal in self.unicodeScalars {
            let intKey = Int(uScal.value)
            letters[intKey] += 1
        }
        
        for uScal in inputStr.unicodeScalars {
            let intKey = Int(uScal.value)
            letters[intKey] -= 1
            if letters[intKey] < 0 {
                return false
            }
        }
        
        return true
    }
}








