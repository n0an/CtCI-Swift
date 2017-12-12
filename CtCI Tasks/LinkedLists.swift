//
//  LinkedLists.swift
//  CtCI Tasks
//
//  Created by nag on 12/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class LinkedList<T: Hashable> {
    
    class Node<T> {
        var item: T
        var next: Node?
        
        init(item: T) {
            self.item = item
        }
    }
    
    var head: Node<T>
    
    init(node: Node<T>) {
        self.head = node
    }
    
    static func append(head: Node<T>, item: T) {
        
        var n = head
        
        while n.next != nil {
            
            n = n.next!
        }
        
        let newChild = Node<T>(item: item)
        
        n.next = newChild
    }
    
    static func deleteNode(head: Node<T>, item: T) -> Node<T>? {
        var n = head
        
        if n.item == item {
            return head.next
        }
        
        while n.next != nil {
            
            if n.next!.item == item {
                n.next = n.next!.next
                return head
            }
            
            n = n.next!
        }
        return head
    }
    
    //print all keys for the class
    func printAllKeys() {
        
        print("------------------")
        
        print("Head item is: \(String(describing: head.item))")
        
        //assign the next instance
        
        var next = head.next
        
        while next != nil {
            print("link item is: \(String(describing: next!.item))")
            next = next?.next
        }
    }
    
    // === Chapter 2. Linked Lists
    // * 2.1. Remove Dups.
    // * Hints: 9, 40
    
    // Solution 1. n0an
    func removeDups() {
        
        var n = head
        
        var checkSet = Set<T>()
        
        checkSet.insert(n.item)
        
        outerLoop: while n.next != nil {
            
            while checkSet.contains(n.next!.item) {
                n.next = n.next!.next
                
                if n.next == nil {
                    break outerLoop
                }
            }
            
            checkSet.insert(n.next!.item)
            
            n = n.next!
        }
    }
    
}










