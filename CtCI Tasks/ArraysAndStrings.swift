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

    // Solution 1. n0an
    func isStringCharactersUnique1() -> Bool {
        
        guard self.count <= 128 && self.count > 0 else { return false }
        guard self.count != 1 else { return true }
        
        let set = Set(self)
        
        return set.count == self.count
    }
    
    // Solution 2. CtCI
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
    
    // Solution 2a
    // PaulHudson
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
    
    // Solution 3. CtCI
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
    // ~ elegant
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
    
    // Solution 3. CtCI
    // ~ brute
    func isPalnidromePermutation3() -> Bool {
        let table = buildCharFrequencyTable(phrase: self.lowercased())
        return checkMaxOneOdd(table: table)
    }
    
    func checkMaxOneOdd(table: [Int]) -> Bool {
        var foundOdd = false
        
        for count in table {
            if count % 2 == 1 {
                if foundOdd {
                    return false
                }
                foundOdd = true
            }
        }
        
        return true
    }
    
    func buildCharFrequencyTable(phrase: String) -> [Int] {
        
        let aVal = Int(Unicode.Scalar.init(unicodeScalarLiteral: "a").value)
        let zVal = Int(Unicode.Scalar.init(unicodeScalarLiteral: "z").value)
        
        var table: [Int] = Array<Int>.init(repeating: 0, count: zVal - aVal + 1)
        
        for scalar in phrase.unicodeScalars {
            
            let intKey = scalar.value
            let x = getCharNumber(scalarValue: intKey)
            
            if x != -1 {
                table[x] += 1
            }
            
        }
        
        return table
    }

    // Solution 3. CtCI
    // ~ brute optimized
    func isPalnidromePermutation4() -> Bool {
        
        var countOdd = 0
        
        let aVal = Int(Unicode.Scalar.init(unicodeScalarLiteral: "a").value)
        let zVal = Int(Unicode.Scalar.init(unicodeScalarLiteral: "z").value)
        
        var table: [Int] = Array<Int>.init(repeating: 0, count: zVal - aVal + 1)
        
        for scalar in self.lowercased().unicodeScalars {
            
            let intKey = scalar.value
            let x = getCharNumber(scalarValue: intKey)
            
            if x != -1 {
                table[x] += 1
                
                if table[x] % 2 == 1 {
                    countOdd += 1
                } else {
                    countOdd -= 1
                }
            }
        }
        
        return countOdd <= 1
    }
    
    // ----------------------------
    // * 1.5. One Away
    // * Hints: 23, 97, 130
    // Solution 1. n0an. O(n2)
    static func oneEditAway1(inputStr1: String, inputStr2: String) -> Bool {
        
        guard abs(inputStr1.count - inputStr2.count) <= 1 else {
            return false
        }
        
        guard inputStr1 != inputStr2 else {
            return false
        }
        
        if inputStr1.count == inputStr2.count {
            
            var oneDifferentChar = false
            
            for charS1 in inputStr1 {
                
                if !inputStr2.contains(charS1) {
                    if oneDifferentChar == true {
                        return false
                    }
                    oneDifferentChar = true
                }
            }
            
            return true
        }
        
        if inputStr2.count > inputStr1.count {
          
            return inputStr2.checkStrContainsAllChars(str1: inputStr1)
        }
        
        if inputStr2.count < inputStr1.count {
            
            return inputStr1.checkStrContainsAllChars(str1: inputStr2)
        }
        
        return false
        
    }
    
    func checkStrContainsAllChars(str1: String) -> Bool {
        for charS1 in str1 {
            if !self.contains(charS1) {
                return false
            }
        }
        
        return true
    }
    
    // Solution 2. CtCI. O(n)
    static func oneEditAway2(first: String, second: String) -> Bool {
        
        if first.count == second.count {
            return first.oneEditReplace(s2: second)
        } else if first.count + 1 == second.count {
            return first.oneEditInsert(s2: second)
        } else if first.count - 1 == second.count {
            return second.oneEditInsert(s2: first)
        }
        
        return false
    }
    
    func oneEditReplace(s2: String) -> Bool {
        var foundDifference = false
        
        for index in 0 ..< self.count {
            if Array(self)[index] != Array(s2)[index] {
                if foundDifference {
                    return false
                }
                foundDifference = true
            }
        }
        return true
    }
    
    func oneEditInsert(s2: String) -> Bool {
        var index1 = 0
        var index2 = 0
        
        while index2 < s2.count && index1 < self.count {
            if Array(self)[index1] != Array(s2)[index2] {
                if index1 != index2 {
                    return false
                }
                index2 += 1
            } else {
                index1 += 1
                index2 += 1
            }
        }
        
        return true
    }
    
    // Solution 3. CtCI. O(n). Optimized
    static func oneEditAway3(first: String, second: String) -> Bool {
        
        guard abs(first.count - second.count) <= 1 else {
            return false
        }
        
        let (s1, s2) = first.count < second.count ? (first, second) : (second, first)
        
        var index1 = 0
        var index2 = 0
        
        var foundDifference = false
        
        while index2 < s2.count && index1 < s1.count {
            
            if Array(s1)[index1] != Array(s2)[index2] {
                // Ensure this is the first difference found
                if foundDifference {
                    return false
                }
                foundDifference = true
                
                if s1.count == s2.count {
                    // On replace, move shorter pointer
                    index1 += 1
                }
            } else {
                index1 += 1 // if matching, move shorter pointer
            }
            index2 += 1 // Always move pointer for longer string
            
        }
        
        return true
    }
    
    // ----------------------------
    // * 1.6. String Compression
    // * Hints: 92, 110
    // Solution 1. n0an
    func compressString() -> String {
        
        let setFromString = Set(self)
        
        if setFromString.count == self.count {
            return self
        }
        
        var outStr = ""
        
        var charAccumulator = 1
        
        for index in 1 ..< self.count {
            
            let currentChar = Array(self)[index]
            let prevChar = Array(self)[index - 1]
            
            if currentChar == prevChar {
                charAccumulator += 1
            } else {
                outStr += "\(prevChar)\(charAccumulator)"
                charAccumulator = 1
            }
        }
        
        outStr += "\(Array(self)[self.count - 1])\(charAccumulator)"

        return outStr
    }
    
    
}

// ----------------------------
// * 1.7. Rotate Matrix
// * Hints: 51, 100
// Solution 1. n0an
func rotateMatrix1<T: Comparable>(_ startMatrix: Array<Array<T>>) -> Array<Array<T>>? {
    
    for element in startMatrix {
        if element.count != startMatrix.count {
            return nil
        }
    }
    
    var outMatrix = Array<Array<T>>()
    
    for mainIndex in 0 ..< startMatrix.count {
        
        var outMatrixInnerArr = Array<T>()
        
        for index1 in stride(from: startMatrix.count - 1, through: 0, by: -1) {
            let innerArr = startMatrix[index1]
            
            outMatrixInnerArr.append(innerArr[mainIndex])
        }
        
        outMatrix.append(outMatrixInnerArr)
    }
    
    return outMatrix
}

// Solution 2. CtCI
func rotateMatrix2(_ matrix: inout [[Int]]) -> Bool {
    
    if matrix.count == 0 || matrix.count != matrix[0].count {
        return false
    }
    
    let n = matrix.count
    
    for layer in 0 ..< n / 2 {
        let first = layer
        let last = n - 1 - layer
        
        for i in first ..< last {
            let offset = i - first
            
            let top = matrix[first][i] // save top
            
            // left -> top
            matrix[first][i] = matrix[last - offset][first]
            
            // bottom -> left
            matrix[last - offset][first] = matrix[last][last - offset]
            
            // right -> bottom
            matrix[last][last - offset] = matrix[i][last]
            
            // top -> right
            matrix[i][last] = top // right <- saved top
        }
    }
    
    return true
}










