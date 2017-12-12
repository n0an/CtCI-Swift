//
//  linkedListsTests.swift
//  CtCI_TasksTests
//
//  Created by nag on 12/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import CtCI_Tasks

class linkedListsTests: XCTestCase {
    
    var linkedList: LinkedList<String>!
    
    override func setUp() {
        super.setUp()
        
        linkedList = LinkedList<String>()
        linkedList.append(item: "A")
        linkedList.append(item: "B")
        linkedList.append(item: "C")
        linkedList.append(item: "A")
        linkedList.append(item: "B")
        linkedList.append(item: "F")
        linkedList.append(item: "B")
        linkedList.append(item: "B")
        linkedList.append(item: "A")
    }
    
    func testLLAppend() {
        let linkedList = LinkedList<String>()
        XCTAssertEqual(linkedList.getAllKeys(), "")
        
        linkedList.append(item: "A")
        linkedList.append(item: "B")
        
        XCTAssertEqual(linkedList.getAllKeys(), "AB")
    }
    
    func testLLDelete() {
        let linkedList = LinkedList<String>()
        XCTAssertEqual(linkedList.getAllKeys(), "")
        
        linkedList.append(item: "A")
        linkedList.append(item: "B")
        linkedList.append(item: "C")
        XCTAssertEqual(linkedList.getAllKeys(), "ABC")
        
        linkedList.deleteNode(item: "B")

        XCTAssertEqual(linkedList.getAllKeys(), "AC")
    }
    
    func test2_1_1_removeLLDups() {

        linkedList.removeDups1()
        
        let checkStr = "ABCF"
        
        XCTAssertEqual(linkedList.getAllKeys(), checkStr)
    }
    
    func test2_1_2_removeLLDups() {
        
        linkedList.removeDups2()
        
        linkedList.printAllKeys()
        
        let checkStr = "ABCF"
        
        XCTAssertEqual(linkedList.getAllKeys(), checkStr)
    }
    
    func test2_1_3_removeLLDups() {
        
        linkedList.removeDups3()
        
        linkedList.printAllKeys()
        
        let checkStr = "ABCF"
        
        XCTAssertEqual(linkedList.getAllKeys(), checkStr)
    }
    
}
