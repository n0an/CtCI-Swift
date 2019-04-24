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
    
    // =====================================
    // ==== Chapter 4. Trees and Graphs ====
    // =====================================
    
    let arr = [1,2,3,4,5]
    
    override func setUp() {
        
    }
    
    // * 4.2. Minimal Tree. 121
    // * Hints: 19, 73, 116
    func test4_2_minimalTree() {
        
        let node = TreeNode.createMinimalBST(arr)
        
        TreeNode.inOrderTraversal(node: node)
        print("=====")
        TreeNode.preOrderTraversal(node: node)
        print("=====")
        TreeNode.postOrderTraversal(node: node)
    }
    
    
    // * 4.4. Check Balanced
    // * Hints: 21, 33, 49, 105, 124
    func test4_4_checkBalanced() {
        
        let str = "APPLE"
        
        /*      A
               / \
              P   P
             /     \
            L       E
         */
        
        var nodes1 = str.map { return TreeNode(name: String($0)) }

        nodes1[0].left = nodes1[1]
        nodes1[0].right = nodes1[2]
        nodes1[1].left = nodes1[3]
        nodes1[2].right = nodes1[4]

        XCTAssertTrue(TreeNode.isBalanced(root: nodes1[0]))
        
        /*      A
               / \
              P   P
             /
            L
            \
             E
         */
        
        var nodes2 = str.map { return TreeNode(name: String($0)) }
        
        nodes2[0].left = nodes2[1]
        nodes2[0].right = nodes2[2]
        nodes2[1].left = nodes2[3]
        nodes2[3].right = nodes2[4]
        
        XCTAssertFalse(TreeNode.isBalanced(root: nodes2[0]))
        
    }
    
    // * 4.5. Validate BST
    func test4_5_validateBST_True() {
        let arr = [3, 5, 7, 10, 15, 17, 20, 30]
        
        // BST
        var nodes = arr.map { TreeNode(name: String($0))  }
        
        treeNodeWithIntValue(val: 20, nodes: nodes)!.left = treeNodeWithIntValue(val: 10, nodes: nodes)!
        treeNodeWithIntValue(val: 20, nodes: nodes)!.right = treeNodeWithIntValue(val: 30, nodes: nodes)!
        
        treeNodeWithIntValue(val: 10, nodes: nodes)!.left = treeNodeWithIntValue(val: 5, nodes: nodes)!
        treeNodeWithIntValue(val: 10, nodes: nodes)!.right = treeNodeWithIntValue(val: 15, nodes: nodes)!
        
        treeNodeWithIntValue(val: 5, nodes: nodes)!.left = treeNodeWithIntValue(val: 3, nodes: nodes)!
        treeNodeWithIntValue(val: 5, nodes: nodes)!.right = treeNodeWithIntValue(val: 7, nodes: nodes)!
        
        XCTAssertTrue(TreeNode.isBST(root: treeNodeWithIntValue(val: 20, nodes: nodes)!))
        
        // NOT BST
        nodes = arr.map { TreeNode(name: String($0))  }
        
        treeNodeWithIntValue(val: 20, nodes: nodes)!.left = treeNodeWithIntValue(val: 10, nodes: nodes)!
        treeNodeWithIntValue(val: 20, nodes: nodes)!.right = treeNodeWithIntValue(val: 30, nodes: nodes)!
        
        treeNodeWithIntValue(val: 30, nodes: nodes)!.left = treeNodeWithIntValue(val: 7, nodes: nodes)!
        
        treeNodeWithIntValue(val: 10, nodes: nodes)!.left = treeNodeWithIntValue(val: 5, nodes: nodes)!
        treeNodeWithIntValue(val: 10, nodes: nodes)!.right = treeNodeWithIntValue(val: 15, nodes: nodes)!
        
        treeNodeWithIntValue(val: 5, nodes: nodes)!.left = treeNodeWithIntValue(val: 3, nodes: nodes)!
        
        XCTAssertFalse(TreeNode.isBST(root: treeNodeWithIntValue(val: 20, nodes: nodes)!))

    }
    
    // MARK: - HELPER METHODS
    func treeNodeWithIntValue(val: Int, nodes: [TreeNode]) -> TreeNode? {
        for node in nodes {
            if node.name == String(val) {
                return node
            }
        }
        
        return nil
    }
}
