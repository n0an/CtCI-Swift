//
//  TreesAndGraphs.swift
//  CtCI Tasks
//
//  Created by nag on 22/04/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//


// Questions - 121
// Solutions - 253

import Foundation

class TreeNode {
    var name: String!
    var children: [TreeNode]!
    
    var left: TreeNode!
    var right: TreeNode!
    
    init(name: String) {
        self.name = name
    }
    
    static func inOrderTraversal(node: TreeNode?) {
        if let node = node {
            inOrderTraversal(node: node.left)
            visit(node)
            inOrderTraversal(node: node.right)
        }
    }
    
    static func preOrderTraversal(node: TreeNode?) {
        if let node = node {
            visit(node)
            preOrderTraversal(node: node.left)
            preOrderTraversal(node: node.right)
        }
    }
    
    static func postOrderTraversal(node: TreeNode?) {
        if let node = node {
            postOrderTraversal(node: node.left)
            postOrderTraversal(node: node.right)
            visit(node)
        }
    }
    
    static func visit(_ node: TreeNode) {
        print(node.name)
    }
}


class GraphNode: Comparable {
    static func < (lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name: String!
    var adjacent: [GraphNode]!
    var visited = false
    
}

class Graph {
    var nodes: [GraphNode]!
    
    func dfs(root: GraphNode?) {
        guard let root = root else { return }
        
        visit(root)
        
        root.visited = true
        
        for n in root.adjacent {
            if n.visited == false {
                dfs(root: n)
            }
        }
    }
    
    func bfs(root: GraphNode) {
        let queue = MyQueue<GraphNode>()
        root.visited = true
        
        queue.add(item: root)
        
        while !queue.isEmpty() {
            let r = queue.remove()!
            visit(r)
            
            for n in r.adjacent {
                if n.visited == false {
                    n.visited = true
                    queue.add(item: n)
                }
            }
        }
    }
    
    func visit(_ node: GraphNode) {
        print(node.name)
    }
    
    
}

// * 4.1. Route Between Nodes. 121
// * Hints: 127


// * 4.2. Minimal Tree. 121
// * Hints: 19, 73, 116
extension TreeNode {
    static func createMinimalBST(_ array: [Int]) -> TreeNode? {
        return createMinimalBST(array, 0, array.count - 1)
    }
    
    static func createMinimalBST(_ array: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if end < start {
            return nil
        }
        
        let mid = (start + end) / 2
        
        let n = TreeNode(name: String(array[mid]))
        n.left = createMinimalBST(array, start, mid - 1)
        n.right = createMinimalBST(array, mid + 1, end)
        return n
    }
}

// * 4.3. Minimal Tree. 121
// * Hints: 19, 73, 116



