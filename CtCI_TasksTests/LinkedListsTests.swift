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
