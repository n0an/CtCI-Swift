//
//  TreesAndGraphs.swift
//  CtCI Tasks
//
//  Created by nag on 22/04/2019.
//  Copyright © 2019 Anton Novoselov. All rights reserved.
//

import Foundation

class TreeNode {
    var name: String!
    var children: [TreeNode]!
    
    var left: TreeNode!
    var right: TreeNode!
    
    func inOrderTraversal(node: TreeNode?) {
        if let node = node {
            inOrderTraversal(node: node.left)
            visit(node)
            inOrderTraversal(node: node.right)
        }
    }
    
    func preOrderTraversal(node: TreeNode?) {
        if let node = node {
            visit(node)
            preOrderTraversal(node: node.left)
            preOrderTraversal(node: node.right)
        }
    }
    
    func postOrderTraversal(node: TreeNode?) {
        if let node = node {
            postOrderTraversal(node: node.left)
            postOrderTraversal(node: node.right)
            visit(node)
        }
    }
    
    func visit(_ node: TreeNode) {
        print(node.name)
    }
}

class GraphNode {
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







