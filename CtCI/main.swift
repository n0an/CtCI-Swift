//
//  main.swift
//  CtCI
//
//  Created by Anton Novoselov on 03/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// =====================================
// === Chapter 1. Arrays and Strings ===
// =====================================
// * 1.1. Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
// * Hints: 44, 117, 131


let str111 = "abcdefg"
let str112 = "abcdefgg"

print(str112.isStringCharactersUnique1())
print(str112.isStringCharactersUnique2())
print(str112.isStringCharactersUnique3())
print(str111.isStringCharactersUnique4())

print("------------------------------")

// * 1.2. Given two strings, write a method to decide if one is a permutation of the other
// * Hints: 1, 84, 122, 131

let str121 = "Hello"
let str122 = "ellHo"
print(str121.isStringPermutation1(inputStr: str122))
print(str121.isStringPermutation4(inputStr: str122))


