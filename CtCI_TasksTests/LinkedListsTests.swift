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
    
    func test2_1_removeLLDups() {

        let linkedList = LinkedList<String>()
        linkedList.append(item: "A")
        linkedList.append(item: "B")
        linkedList.append(item: "C")
        linkedList.append(item: "A")
        linkedList.append(item: "B")
        linkedList.append(item: "F")
        linkedList.append(item: "B")
        linkedList.append(item: "B")
        linkedList.append(item: "A")
        
        linkedList.printAllKeys()
        print("-----")
        
        linkedList.removeDups()
        
        linkedList.printAllKeys()
        
        let checkStr = "ABCF"
        
        XCTAssertEqual(linkedList.getAllKeys(), checkStr)
    }
    
}
