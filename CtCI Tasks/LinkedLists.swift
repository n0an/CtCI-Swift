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
    
    var head: Node<T>?
    
    func append(item: T) {
        
        let newChild = Node<T>(item: item)
        
        if var n = head {
            
            while n.next != nil {
                
                n = n.next!
            }
            
            n.next = newChild
            
        } else {
            head = newChild
        }
        
        
    }
    
    func deleteNode(item: T) {
        
        guard var n = head else {
            return
        }
        
        if n.item == item {
            head = head?.next
        }
        
        while n.next != nil {
            
            if n.next!.item == item {
                n.next = n.next!.next
            }
            
            n = n.next!
        }
    }
    
    //print all keys for the class
    func printAllKeys() {
        
        guard let head = head else { return }
        
        print("\(head.item)")
        
        var next = head.next
        
        while next != nil {
            print("\(next!.item)")
            next = next!.next
        }
    }
    
    func getAllKeys() -> String {
        var outStr = ""
        
        guard let head = head else { return outStr }
        
        outStr += "\(head.item)"
        
        var next = head.next
        
        while next != nil {
            outStr += "\(next!.item)"
            next = next!.next
        }
        
        return outStr
    }
    
    // === Chapter 2. Linked Lists
    // * 2.1. Remove Dups.
    // * Hints: 9, 40
    
    // Solution 1. n0an
    func removeDups() {
        
        guard var n = head else { return }
        
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










