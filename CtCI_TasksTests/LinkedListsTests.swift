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
    
    // =====================================
    // ====== Chapter 2. Linked Lists ======
    // =====================================
    
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
        XCTAssertEqual(linkedList.getAllKeysString(), "")
        
        linkedList.append(item: "A")
        linkedList.append(item: "B")
        
        XCTAssertEqual(linkedList.getAllKeysString(), "AB")
    }
    
    func testLLDelete() {
        let linkedList = LinkedList<String>()
        XCTAssertEqual(linkedList.getAllKeysString(), "")
        
        linkedList.append(item: "A")
        linkedList.append(item: "B")
        linkedList.append(item: "C")
        XCTAssertEqual(linkedList.getAllKeysString(), "ABC")
        
        linkedList.deleteNode(item: "B")

        XCTAssertEqual(linkedList.getAllKeysString(), "AC")
    }
    
    // * 2.1. Remove Dups.
    // * Hints: 9, 40
    func test2_1_1_removeLLDups() {
        linkedList.removeDups1()
        let checkStr = "ABCF"
        XCTAssertEqual(linkedList.getAllKeysString(), checkStr)
    }
    
    func test2_1_2_removeLLDups() {
        linkedList.removeDups2()
        linkedList.printAllKeys()
        let checkStr = "ABCF"
        XCTAssertEqual(linkedList.getAllKeysString(), checkStr)
    }
    
    func test2_1_3_removeLLDups() {
        linkedList.removeDups3()
        linkedList.printAllKeys()
        let checkStr = "ABCF"
        XCTAssertEqual(linkedList.getAllKeysString(), checkStr)
    }
    
    // * 2.2. Return Kth to Last
    // * Hints: 8, 25, 41, 67, 126
    func test2_2_1_returnKthToLast() {
        XCTAssertEqual(linkedList.elementToLast1(kth: 1), "A")
        XCTAssertEqual(linkedList.elementToLast1(kth: 0), "A")

        XCTAssertEqual(linkedList.elementToLast1(kth: 4), "F")
        XCTAssertNil(linkedList.elementToLast1(kth: 10))
        
        XCTAssertEqual(linkedList.elementToLast1a(kth: 1), "A")
        XCTAssertEqual(linkedList.elementToLast1a(kth: 0), "A")
        
        XCTAssertEqual(linkedList.elementToLast1a(kth: 4), "F")
        XCTAssertNil(linkedList.elementToLast1a(kth: 10))
    }
    
    func test2_2_2_returnKthToLast() {
        _ = LinkedList.elementToLast2(head: linkedList.head, kth: 0)
        _ = LinkedList.elementToLast2(head: linkedList.head, kth: 1)
        _ = LinkedList.elementToLast2(head: linkedList.head, kth: 4)
        _ = LinkedList.elementToLast2(head: linkedList.head, kth: 10)

    }
    
    func test2_2_3_returnKthToLast() {
        XCTAssertEqual(LinkedList.elementToLast3(head: linkedList.head, kth: 1), "A")
        
        XCTAssertEqual(LinkedList.elementToLast3(head: linkedList.head, kth: 4), "F")
        XCTAssertNil(LinkedList.elementToLast3(head: linkedList.head, kth: 10))
    }
    
    func test2_2_4_returnKthToLast() {
        
        XCTAssertEqual(linkedList.elementToLast4(kth: 1), "A")
        
        XCTAssertEqual(linkedList.elementToLast4(kth: 4), "F")
        XCTAssertNil(linkedList.elementToLast4(kth: 10))
        
    }
    
    // * 2.3. Delete Middle Node. Given only access to that node
    // * Hints: 72
    func test2_3_1_deleteMiddleNode() {
        
        let nodeToDelete = linkedList.getNode(forItem: "C")
        
        _ = linkedList.deleteMiddleNode(nodeToDelete)
        
        XCTAssertEqual(linkedList.getAllKeysString(), "ABABFBBA")
    }
    
    // * 2.4. Partition.
    // * Hints: 3, 24
    func test2_4_1_partition() {
        
        let linkedList = LinkedList<Int>()
        linkedList.append(item: 3)
        linkedList.append(item: 5)
        linkedList.append(item: 8)
        linkedList.append(item: 5)
        linkedList.append(item: 10)
        linkedList.append(item: 2)
        linkedList.append(item: 1)
        
        let partitioningNode = linkedList.getNode(forItem: 5)
        

    }
    
}












