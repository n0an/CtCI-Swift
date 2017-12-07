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
    
    // =====================================
    // === Chapter 1. Arrays and Strings ===
    // =====================================
    let greetingTask1_1 = "------ 1.1. Is Unique chars ------"
    let str111 = "abcdefg"
    let str112 = "abcdefgg"
    
    let greetingTask1_2 = "------ 1.2. Check Permutation ------"
    let str121 = "Hello"
    let str122 = "ellHo"
    
    let greetingTask1_3 = "------ 1.3. URLify. Replace all spaces in a string with '%20' ------"
    let str131 = "Replace all "
    
    let greetingTask1_4 = "------ 1.4. Palindrome permutation ------"
    let str141 = "Tact Coa"
    let str142 = "Tact Coab"
    
    let greetingTask1_5 = "------ 1.5. One Away ------"
    let str151 = "pale"
    let str152 = "ple"
    
    let str153 = "pales"
    let str154 = "bale"
    let str155 = "bake"
    
    let greetingTask1_6 = "------ 1.6. String Compression ------"
    let str161 = "aabcccccaaa"
    let str162 = "abcd"
    
    let startMatrix1_7_str3x3 = [["a", "b", "c"],
                                 ["d", "e", "f"],
                                 ["g", "h", "i"]]
    
    let rotatedMatrix1_7_str3x3 = [["g", "d", "a"],
                                   ["h", "e", "b"],
                                   ["i", "f", "c"]]
    
    let rotatedAgainMatrix1_7_3x3 = [["i", "h", "g"],
                                     ["f", "e", "d"],
                                     ["c", "b", "a"]]
    
    let startMatrix1_7_str5x5 = [["a", "b", "c", "d", "e"],
                                 ["f", "g", "h", "i", "g"],
                                 ["k", "l", "m", "n", "o"],
                                 ["p", "q", "r", "s", "t"],
                                 ["u", "v", "w", "x", "y"]]
    
    let rotatedMatrix1_7_str5x5 = [["u", "p", "k", "f", "a"],
                                   ["v", "q", "l", "g", "b"],
                                   ["w", "r", "m", "h", "c"],
                                   ["x", "s", "n", "i", "d"],
                                   ["y", "t", "o", "g", "e"]]
    
    var startMatrix1_7_3x3 = [[1, 2, 3],
                              [4, 5, 6],
                              [7, 8, 9]]
    
    let rotatedMatrix1_7_3x3 = [[7, 4, 1],
                                [8, 5, 2],
                                [9, 6, 3]]
    
    var startMatrix1_7_4x4 = [[1, 2, 3, 4],
                              [5, 6, 7, 8],
                              [9, 10, 11, 12],
                              [13, 14, 15, 16]]
    
    let rotatedMatrix1_7_4x4 = [[13, 9, 5, 1],
                                [14, 10, 6, 2],
                                [15, 11, 7, 3],
                                [16, 12, 8, 4]]
    
    var startMatrix1_8 = [[1, 2, 3, 4, 99, 34],
                          [5, 6, 0, 8, 22, 44],
                          [9, 10, 11, 12, 31, 12],
                          [9, 10, 11, 12, 31, 12],
                          [9, 10, 11, 12, 31, 12]]
    
    let nulifiedMatrix1_8 = [[1, 2, 0, 4, 99, 34],
                             [0, 0, 0, 0, 0, 0],
                             [9, 10, 0, 12, 31, 12],
                             [9, 10, 0, 12, 31, 12],
                             [9, 10, 0, 12, 31, 12]]
    
    
    override func setUp() {
        super.setUp()
        
    }
    
    // * 1.1. Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
    // * Hints: 44, 117, 131
    func test1_1_isStringCharsUnique() {
        XCTAssertFalse(str112.isStringCharactersUnique1())
        XCTAssertFalse(str112.isStringCharactersUnique2())
        XCTAssertFalse(str112.isStringCharactersUnique3())
        XCTAssertTrue(str111.isStringCharactersUnique4())
    }
    
    // * 1.2. Given two strings, write a method to decide if one is a permutation of the other
    // * Hints: 1, 84, 122, 131
    func test1_2_isPermutation() {
        
        XCTAssertTrue(str121.isStringPermutation1(inputStr: str122))
        XCTAssertTrue(str121.isStringPermutation4(inputStr: str122))
    }
    
    // * 1.3. Replace all spaces in a string with '%20'
    // * Hints: 53, 118
    func test1_3_URLify() {
        print(greetingTask1_3)
        
        XCTAssertEqual(str131.urlify(), "Replace%20all")
    }
    
    // * 1.4. Palindrome permutation
    // * Hints: 106, 121, 134, 136
    func test1_4_isPalindromePermutation() {
        print(greetingTask1_4)
        
        XCTAssertTrue(str141.isPalnidromePermutation1())
        XCTAssertTrue(str141.isPalnidromePermutation2())
        XCTAssertTrue(str141.isPalnidromePermutation3())
        XCTAssertTrue(str141.isPalnidromePermutation4())
        
        XCTAssertFalse(str142.isPalnidromePermutation1())
        XCTAssertFalse(str142.isPalnidromePermutation2())
        XCTAssertFalse(str142.isPalnidromePermutation3())
        XCTAssertFalse(str142.isPalnidromePermutation4())
    }
    
    // * 1.5. One Away
    // * Hints: 23, 97, 130
    func test1_5_isOneAwayEdit1() {
        print(greetingTask1_5)
        
        XCTAssertTrue(String.oneEditAway1(inputStr1: str151, inputStr2: str152), "No one away")
        XCTAssertTrue(String.oneEditAway1(inputStr1: str153, inputStr2: str151), "No one away")
        XCTAssertTrue(String.oneEditAway1(inputStr1: str151, inputStr2: str154), "No one away")
        XCTAssertFalse(String.oneEditAway1(inputStr1: str151, inputStr2: str155), "Must be false")
    }
    
    func test1_5_isOneAwayEdit2() {
        print(greetingTask1_5)
        
        XCTAssertTrue(String.oneEditAway2(first: str151, second: str152), "No one away edit")
        XCTAssertTrue(String.oneEditAway2(first: str153, second: str151), "No one away edit")
        XCTAssertTrue(String.oneEditAway2(first: str151, second: str154), "No one away edit")
        XCTAssertFalse(String.oneEditAway2(first: str151, second: str155), "Must be false")
    }
    
    func test1_5_isOneAwayEdit3() {
        print(greetingTask1_5)
        
        XCTAssertTrue(String.oneEditAway3(first: str151, second: str152), "No one away edit")
        XCTAssertTrue(String.oneEditAway3(first: str153, second: str151), "No one away edit")
        XCTAssertTrue(String.oneEditAway3(first: str151, second: str154), "No one away edit")
        XCTAssertFalse(String.oneEditAway3(first: str151, second: str155), "Must be false")
    }
    
    // * 1.6. String Compression
    // * Hints: 92, 110
    func test1_6_stringCompression() {
        print(greetingTask1_6)
        
        XCTAssertEqual(str161.compressString(), "a2b1c5a3")
        XCTAssertEqual(str162.compressString(), "abcd")
        XCTAssertEqual("a".compressString(), "a")
        XCTAssertEqual("aaabb".compressString(), "a3b2")
    }
    
    // * 1.7. Rotate Matrix
    // * Hints: 51, 100
    func test1_7_rotateMatrix3x3() {
       
        let rotatedInReal = rotateMatrix1(startMatrix1_7_str3x3)
        
        XCTAssertNotNil(rotatedInReal)
        
        XCTAssertTrue(rotatedMatrix1_7_str3x3.elementsEqual(rotatedInReal!) { $0 == $1 })

        let rotatedInRealAgain = rotateMatrix1(rotatedInReal!)
        
        XCTAssertNotNil(rotatedInRealAgain)
        
        XCTAssertTrue(rotatedAgainMatrix1_7_3x3.elementsEqual(rotatedInRealAgain!) { $0 == $1 })
    }
    
    func test1_7_rotateMatrix5x5() {
    
        var rotatedInReal = rotateMatrix1(startMatrix1_7_str5x5)
        
        XCTAssertNotNil(rotatedInReal)
        
        for index in 0 ..< rotatedMatrix1_7_str5x5.count {
            XCTAssertEqual(rotatedMatrix1_7_str5x5[index], rotatedInReal![index])
        }
    }
    
    func test1_7_2_rotateMatrix3x3() {
        XCTAssertTrue(rotateMatrix2(&startMatrix1_7_3x3))
        
        for index in 0 ..< rotatedMatrix1_7_3x3.count {
            XCTAssertEqual(rotatedMatrix1_7_3x3[index], startMatrix1_7_3x3[index])
        }
    }
    
    func test1_7_2_rotateMatrix4x4() {
        XCTAssertTrue(rotateMatrix2(&startMatrix1_7_4x4))
        
        XCTAssertTrue(startMatrix1_7_4x4.elementsEqual(rotatedMatrix1_7_4x4) { $0 == $1 })
    }
    
    // * 1.8. Zero Matrix
    // * Hints: 17, 74, 102
    func test1_8_1_zeroMatrix() {
    XCTAssertTrue(nulifiedMatrix1_8.elementsEqual(zeroMatrix1(startMatrix1_8)) { $0 == $1 })
    }
    
    func test1_8_2_zeroMatrix() {
        setZeroes1(&startMatrix1_8)
        XCTAssertTrue(nulifiedMatrix1_8.elementsEqual(startMatrix1_8) { $0 == $1 })
    }
    
    func test1_8_3_zeroMatrix() {
        setZeroes2(&startMatrix1_8)
        XCTAssertTrue(nulifiedMatrix1_8.elementsEqual(startMatrix1_8) { $0 == $1 })
    }
}



