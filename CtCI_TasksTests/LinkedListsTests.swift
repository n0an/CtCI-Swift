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
    
    var linkedListNode: Node<String>!
    
    var palindromeListNode: Node<String>!
    
    
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
        
        palindromeListNode = Node<String>(item: "A")
        palindromeListNode.appendToTail(item: "Bd")
        palindromeListNode.appendToTail(item: "C")
        palindromeListNode.appendToTail(item: "Bd")
        palindromeListNode.appendToTail(item: "A")
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
    
    // * 2.5. Sum Lists.
    // * Hints: 7, 30, 71, 95, 109
    func test2_5_1a_sumList() {
        let linkedListNode1 = Node<Int>(item: 7)
        linkedListNode1.appendToTail(item: 1)
        linkedListNode1.appendToTail(item: 6)
        
        let linkedListNode2 = Node<Int>(item: 5)
        linkedListNode2.appendToTail(item: 9)
        linkedListNode2.appendToTail(item: 2)
        
        let llSum = Node<Int>.sumList1a(node1: linkedListNode1, node2: linkedListNode2)
        
        XCTAssertEqual(llSum?.getAllKeysString(head: llSum), "219")
    }
    
    func test2_5_1b_sumList() {
        let linkedListNode1 = Node<Int>(item: 6)
        linkedListNode1.appendToTail(item: 1)
        linkedListNode1.appendToTail(item: 7)
        
        let linkedListNode2 = Node<Int>(item: 2)
        linkedListNode2.appendToTail(item: 9)
        linkedListNode2.appendToTail(item: 5)
        
        let llSum = Node<Int>.sumList1b(node1: linkedListNode1, node2: linkedListNode2)
        
        XCTAssertEqual(llSum?.getAllKeysString(head: llSum), "912")
    }
    
    func test2_5_2_sumList() {
        let linkedListNode1 = Node<Int>(item: 7)
        linkedListNode1.appendToTail(item: 1)
        linkedListNode1.appendToTail(item: 6)
        
        let linkedListNode2 = Node<Int>(item: 5)
        linkedListNode2.appendToTail(item: 9)
        linkedListNode2.appendToTail(item: 2)
        
        let llSum = linkedListNode1.addLists2a(l1: linkedListNode1, l2: linkedListNode2, carry: 0)
        
        XCTAssertEqual(llSum?.getAllKeysString(head: llSum), "219")
    }
    
    func test2_5_2b_sumList() {
        let linkedListNode1 = Node<Int>(item: 6)
        linkedListNode1.appendToTail(item: 1)
        linkedListNode1.appendToTail(item: 7)
        
        let linkedListNode2 = Node<Int>(item: 2)
        linkedListNode2.appendToTail(item: 9)
        linkedListNode2.appendToTail(item: 5)
        
        let llSum = linkedListNode1.addLists2b(l1: linkedListNode1, l2: linkedListNode2, carry: 0)

        XCTAssertEqual(llSum?.getAllKeysString(head: llSum), "912")
    }

    // * 2.6. Palindrome
    // * Hints: 5, 13, 29, 61, 101
    func test2_6_1_palindrome() {
        
        XCTAssertTrue(palindromeListNode.isPalindrome1(palindromeListNode))
        XCTAssertFalse(linkedListNode.isPalindrome1(linkedListNode))
    }
    
    func test2_6_2_palindrome() {
        
        XCTAssertTrue(palindromeListNode.isPalindrome2(palindromeListNode))
        XCTAssertFalse(linkedListNode.isPalindrome2(linkedListNode))
    }
    
    func test2_6_3_palindrome() {
        
        XCTAssertTrue(palindromeListNode.isPalindrome3(palindromeListNode))
        XCTAssertFalse(linkedListNode.isPalindrome3(linkedListNode))
    }
    
    // * 2.7. Intersection
    // * Hints: 20, 45, 55, 65, 76, 93, 111, 120, 129
    func test2_7_1_intersection() {
        
        let l1 = Node<Int>(item: 3)
        l1.appendToTail(item: 1)
        l1.appendToTail(item: 5)
        l1.appendToTail(item: 9)
        l1.appendToTail(item: 7)
        l1.appendToTail(item: 2)
        l1.appendToTail(item: 1)

        let l2 = Node<Int>(item: 4)
        l2.appendToTail(item: 6)
        l2.appendNodeToTail(node: l1.getNode(head: l1, forItem: 7)!)
        
        let intersectionl1l2 = l1.getIntersection1(l1: l1, l2: l2)
        
        XCTAssertNotNil(intersectionl1l2)
        XCTAssertEqual(intersectionl1l2!.item!, 7)
        
        let l3 = Node<Int>(item: 4)
        l3.appendToTail(item: 6)
        l3.appendToTail(item: 7)
        l3.appendToTail(item: 2)
        l3.appendToTail(item: 1)
        
        let intersectionl1l3 = l1.getIntersection1(l1: l1, l2: l3)
        
        XCTAssertNil(intersectionl1l3)
    }
    
    func test2_7_2_intersection() {
        
        let l1 = Node<Int>(item: 3)
        l1.appendToTail(item: 1)
        l1.appendToTail(item: 5)
        l1.appendToTail(item: 9)
        l1.appendToTail(item: 7)
        l1.appendToTail(item: 2)
        l1.appendToTail(item: 1)
        
        let l2 = Node<Int>(item: 4)
        l2.appendToTail(item: 6)
        l2.appendNodeToTail(node: l1.getNode(head: l1, forItem: 7)!)
        
        let intersectionl1l2 = l1.getIntersection2(list1: l1, list2: l2)
        
        XCTAssertNotNil(intersectionl1l2)
        XCTAssertEqual(intersectionl1l2!.item!, 7)
        
    }
    
    
}





