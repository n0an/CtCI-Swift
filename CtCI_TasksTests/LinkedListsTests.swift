//
//  LinkedListsTests.swift
//  CtCI_TasksTests
//
//  Created by nag on 12/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import CtCI_Tasks

class LinkedListsTests: XCTestCase {
    
    func test2_1_removeLLDups() {
        let headNode = LinkedList<String>.Node(item: "A")
        
        let linkedList = LinkedList(node: headNode)
        
        LinkedList.append(head: linkedList.head, item: "B")
        LinkedList.append(head: linkedList.head, item: "C")
        LinkedList.append(head: linkedList.head, item: "A")
        LinkedList.append(head: linkedList.head, item: "B")
        LinkedList.append(head: linkedList.head, item: "F")
        LinkedList.append(head: linkedList.head, item: "B")
        LinkedList.append(head: linkedList.head, item: "B")
        LinkedList.append(head: linkedList.head, item: "A")

        linkedList.printAllKeys()
        
        linkedList.removeDups()
        
        linkedList.printAllKeys()
    }
    
}
