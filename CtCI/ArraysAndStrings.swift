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
        
        guard self.count <= 128 && self.count > 0 else { return false }
        guard self.count != 1 else { return true }
        
        let set = Set(self)
        
        return set.count == self.count
    }
    
    // Solution 2
    func isStringCharactersUnique2() -> Bool {
        
        guard self.count <= 128 && self.count > 0 else { return false }
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
    
    // Solution 2a. PaulHudson
    func isStringCharactersUnique2a() -> Bool {
        
        guard self.count <= 128 && self.count > 0 else { return false }
        guard self.count != 1 else { return true }
        
        var usedLetters = [Character]()
        
        for letter in self {
            if usedLetters.contains(letter) {
                return false
            }
            
            usedLetters.append(letter)
        }
        
        return true
    }
    
    // Solution 3
    func isStringCharactersUnique3() -> Bool {
        // Without additional data structures
        guard self.count <= 128 && self.count > 0 else { return false }
        guard self.count != 1 else { return true }
        
        for char in self {
            var counter = 0
            
            for ch in self {
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
    
    // Solution 4. CtCI
    func isStringCharactersUnique4() -> Bool {
        // Without additional data structures
        var checker = 0
        
        for scalar in self.unicodeScalars {
            let intKey = scalar.value
            
            let val = Int(intKey - Unicode.Scalar.init(unicodeScalarLiteral: "a").value)
            
            if checker & (1 << val) > 0 {
                return false
            }
            
            checker |= 1 << val
        }
        
        return true
    }
    
    // ----------------------------
    // * 1.2. Given two strings, write a method to decide if one is a permutation of the other
    // * Hints: 1, 84, 122, 131

    // Solution 1
    func isStringPermutation1(inputStr: String) -> Bool {
        
        return self.sorted() == inputStr.sorted()

    }
    
    // Solution 2. CtCI
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
    
    // Solution 3. PaulHudson
    func isStringPermutation3(inputStr: String) -> Bool {
        
        var checkString = inputStr
        
        for letter in self {
            if let index = checkString.index(of: letter) {
                checkString.remove(at: index)
            } else {
                return false
            }
        }
        
        return checkString.count == 0
    }
    
    // Solution 4. n0an
    func isStringPermutation4(inputStr: String) -> Bool {
        
        let set1 = NSCountedSet(array: Array(self))
        let set2 = NSCountedSet(array: Array(inputStr))
        
        return set1 == set2
    }
    
    // ----------------------------
    // * 1.3. Replace all spaces in a string with '%20'
    // * Hints: 53, 118
    // Solution1. n0an
    func urlify() -> String {
        var outputStr = self.trimmingCharacters(in: [" "])
        
        let arr = outputStr.components(separatedBy: " ")
        outputStr = arr.joined(separator: "%20")
        
        return outputStr
    }
    
    // ----------------------------
    // * 1.4. Palindrome permutation
    // * Hints: 106, 121, 134, 136
    
    // Solution 1. n0an
    func isPalnidromePermutation1() -> Bool {
        
        guard self.count > 1 else { return false }
        
        let strippedStr = self.lowercased().replacingOccurrences(of: " ", with: "")
        
        var letters = [Character]()
        
        for char in strippedStr {
            
            if let index = letters.index(of: char) {
                letters.remove(at: index)
            } else {
                letters.append(char)
            }
        }
        
        return letters.count <= 1
    }
    
    // Solution 2. CtCI
    func isPalnidromePermutation2() -> Bool {
        
        let bitVector = createBitVector(fromString: self.lowercased())
        return bitVector == 0 || checkExactlyOneBitSet(bitVector: bitVector)
        
    }
    
    // Create a bit vector for the string. For each letter with value i, toggle the ith bit
    func createBitVector(fromString inputStr: String) -> Int {
        
        var bitVector = 0
        
        for scalar in inputStr.unicodeScalars {
            
            let intKey = scalar.value
            let x = getCharNumber(scalarValue: intKey)
            bitVector = toggle(bitVector: bitVector, index: x)
        }
        
        return bitVector
        
    }
    
    func getCharNumber(scalarValue: UInt32) -> Int {
        
        let aVal = Unicode.Scalar.init(unicodeScalarLiteral: "a").value
        let zVal = Unicode.Scalar.init(unicodeScalarLiteral: "z").value
        
        if aVal ... zVal ~= scalarValue {
            return Int(scalarValue - aVal)
        } else {
            return -1
        }
    }
    
    // Toggle the ith bit in the integer
    func toggle( bitVector: Int, index: Int) -> Int {
        
        var bitVector = bitVector
        guard index >= 0 else { return bitVector }
        
        let mask = 1 << index
        
        if bitVector & mask == 0 {
            bitVector |= mask
        } else {
            bitVector &= ~mask
        }
        
        return bitVector
    }
    
    func checkExactlyOneBitSet(bitVector: Int) -> Bool {
        return bitVector & (bitVector - 1) == 0
    }

    
}








