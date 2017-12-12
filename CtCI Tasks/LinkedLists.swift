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
    func removeDups1() {
        
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
    
    // Solution 2. CtCI. O(N)
    func removeDups2() {
        guard head != nil else { return }
        
        var checkSet = Set<T>()
        
        var previous: Node<T>? = nil
        
        var n = head
        
        while n != nil {
            
            if checkSet.contains(n!.item) {
                previous?.next = n!.next
            } else {
                checkSet.insert(n!.item)
                previous = n
            }
            
            n = n!.next
        }
    }
    
    // Solution 3. CtCI. No buffer allowed. Two pointers: current which iterates through the linked list, and runner which checks all subsequent nodes for duplicates. Runs in O(1) space, but O(N2) time.
    func removeDups3() {
        guard head != nil else { return }
        
        var current = head
        
        while current != nil  {
            
            var runner = current
            
            while runner!.next != nil {
                if runner!.next!.item == current!.item {
                    runner!.next = runner!.next!.next
                } else {
                    runner = runner!.next!
                }
            }
            
            current = current!.next
        }
    }
    
    
    
}










