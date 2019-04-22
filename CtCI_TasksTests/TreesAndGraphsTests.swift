//
//  TreesAndGraphsTests.swift
//  CtCI_TasksTests
//
//  Created by nag on 22/04/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import Foundation
import XCTest

@testable import CtCI_Tasks

class TreesAndGraphsTests: XCTestCase {
    override func setUp() {
        
    }
    
    func test4_2_minimalTree() {
        
        let arr = [1,2,3,4,5]
        
        let node = TreeNode.createMinimalBST(arr)
        
        TreeNode.inOrderTraversal(node: node)
        print("=====")
        TreeNode.preOrderTraversal(node: node)
        print("=====")
        TreeNode.postOrderTraversal(node: node)
    }
    
}
