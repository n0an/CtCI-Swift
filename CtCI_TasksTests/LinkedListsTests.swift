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
    
//    var linkedList: LinkedList<String>!
    
    var linkedListNode: Node<String>!
    
    override func setUp() {
        super.setUp()
        
        linkedListNode = Node(item: "A")
        linkedListNode.appendToTail(item: "B")
        linkedListNode.appendToTail(item: "C")
        linkedListNode.appendToTail(item: "A")
        linkedListNode.appendToTail(item: "B")
        linkedListNode.appendToTail(item: "F")
        linkedListNode.appendToTail(item: "B")
        linkedListNode.appendToTail(item: "B")
        linkedListNode.appendToTail(item: "A")
    }
    
    func testLLAppend() {
        let linkedListNode = Node<String>(item: "A")
        
        linkedListNode.appendToTail(item: "B")
        
        XCTAssertEqual(linkedListNode.getAllKeysString(head: linkedListNode), "AB")
    }
    
    func testLLDelete() {
        var linkedListNode = Node<String>(item: "A")
        
        linkedListNode.appendToTail(item: "B")
        linkedListNode.appendToTail(item: "C")
        
        XCTAssertEqual(linkedListNode.getAllKeysString(head: linkedListNode), "ABC")

        linkedListNode = linkedListNode.deleteNode(head: linkedListNode, item: "B")!

        XCTAssertEqual(linkedListNode.getAllKeysString(head: linkedListNode), "AC")
    }
    
    // * 2.1. Remove Dups.
    // * Hints: 9, 40
    func test2_1_1_removeLLDups() {
        linkedListNode.removeDups1(node: linkedListNode)
        let checkStr = "ABCF"
        XCTAssertEqual(linkedListNode.getAllKeysString(head: linkedListNode), checkStr)
    }

    func test2_1_2_removeLLDups() {
        linkedListNode.removeDups2(head: linkedListNode)
        let checkStr = "ABCF"
        XCTAssertEqual(linkedListNode.getAllKeysString(head: linkedListNode), checkStr)
    }

    // * 2.2. Return Kth to Last
    // * Hints: 8, 25, 41, 67, 126
    func test2_2_1_returnKthToLast() {
        XCTAssertEqual(linkedListNode.elementToLast1(head: linkedListNode, kth: 1), "A")
        XCTAssertEqual(linkedListNode.elementToLast1(head: linkedListNode, kth: 0), "A")

        XCTAssertEqual(linkedListNode.elementToLast1(head: linkedListNode, kth: 4), "F")
        XCTAssertNil(linkedListNode.elementToLast1(head: linkedListNode, kth: 10))
    }
    
    func test2_2_2_returnKthToLast() {
        _ = linkedListNode.elementToLast2(head: linkedListNode, kth: 0)
        _ = linkedListNode.elementToLast2(head: linkedListNode, kth: 1)
        _ = linkedListNode.elementToLast2(head: linkedListNode, kth: 4)
        _ = linkedListNode.elementToLast2(head: linkedListNode, kth: 10)

    }

    func test2_2_3_returnKthToLast() {
        
        var node = linkedListNode.elementToLast3(head: linkedListNode, kth: 1)
        XCTAssertEqual(node?.item, "A")
        
        node = linkedListNode.elementToLast3(head: linkedListNode, kth: 4)
        XCTAssertEqual(node?.item, "F")

        node = linkedListNode.elementToLast3(head: linkedListNode, kth: 10)
        XCTAssertNil(node)
        
    }

    func test2_2_4_returnKthToLast() {

        var node = linkedListNode.elementToLast4(head: linkedListNode, kth: 1)
        XCTAssertEqual(node?.item, "A")
        
        node = linkedListNode.elementToLast4(head: linkedListNode, kth: 4)
        XCTAssertEqual(node?.item, "F")
        
        node = linkedListNode.elementToLast4(head: linkedListNode, kth: 10)
        XCTAssertNil(node)

    }

    // * 2.3. Delete Middle Node. Given only access to that node
    // * Hints: 72
    func test2_3_1_deleteMiddleNode() {
        
        let linkedListNode = Node(item: "A")
        linkedListNode.appendToTail(item: "B")
        
        let llNodeToDelete = Node(item: "C")
        
        linkedListNode.appendNodeToTail(node: llNodeToDelete)
        
        linkedListNode.appendToTail(item: "D")
        linkedListNode.appendToTail(item: "E")

        _ = linkedListNode.deleteMiddleNode(llNodeToDelete)

        XCTAssertEqual(linkedListNode.getAllKeysString(head: linkedListNode), "ABDE")
    }

    // * 2.4. Partition.
    // * Hints: 3, 24
    func test2_4_1_partition() {

        let linkedListNode = Node<Int>(item: 3)
        linkedListNode.appendToTail(item: 5)
        linkedListNode.appendToTail(item: 8)
        linkedListNode.appendToTail(item: 5)
        linkedListNode.appendToTail(item: 10)
        linkedListNode.appendToTail(item: 2)
        linkedListNode.appendToTail(item: 1)

        let partitionedNode = linkedListNode.partition1(node: linkedListNode, x: 5)
        
        partitionedNode?.printAllKeys(head: partitionedNode)
        
        XCTAssertEqual(partitionedNode?.getAllKeysString(head: partitionedNode), "32158510")
    }
    
    func test2_4_2_partition() {
        
        let linkedListNode = Node<Int>(item: 3)
        linkedListNode.appendToTail(item: 5)
        linkedListNode.appendToTail(item: 8)
        linkedListNode.appendToTail(item: 5)
        linkedListNode.appendToTail(item: 10)
        linkedListNode.appendToTail(item: 2)
        linkedListNode.appendToTail(item: 1)
        
        let partitionedNode = linkedListNode.partition2(node: linkedListNode, x: 5)
        
        partitionedNode?.printAllKeys(head: partitionedNode)
        
        XCTAssertEqual(partitionedNode?.getAllKeysString(head: partitionedNode), "12358510")
        
    }
    
}





