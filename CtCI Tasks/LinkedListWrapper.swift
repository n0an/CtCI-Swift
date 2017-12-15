//
//  LinkedListWrapper.swift
//  CtCI Tasks
//
//  Created by nag on 13/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// === CLASS NOT USED ===
class LinkedList<T: Hashable> where T: Comparable {

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

    func getNode(forItem item: T) -> Node<T>? {
        guard head != nil else { return nil }

        var n = head

        while n != nil {
            if n!.item == item {
                return n
            }

            n = n!.next
        }

        return nil
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

    func getAllKeysString() -> String {
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

    // * 2.2. Return Kth to Last
    // * Hints: 8, 25, 41, 67, 126
    // Solution 1. n0an
    func elementToLast1(kth: Int) -> T? {
        var kth = kth

        if kth == 0 {
            kth = 1
        }

        guard head != nil else { return nil }

        var current = head

        var dict = [Int: T]()

        var index = 0

        while current != nil {

            dict[index] = current!.item

            index += 1

            current = current!.next
        }

        return dict[index - kth] ?? nil
    }

    // Solution 1a. n0an. Not fully correct, return String? instead of T?
    func elementToLast1a(kth: Int) -> String? {
        var kth = kth

        if kth == 0 {
            kth = 1
        }

        guard head != nil else { return nil }

        let str = self.getAllKeysString()

        if str.count < kth { return nil }

        return String(Array(str)[str.count - kth])
    }

    // Solution 2. CtCI. Recursive. Not returning. Printing kth element
    static func elementToLast2(head: Node<T>?, kth: Int) -> Int {
        guard head != nil else {
            return 0
        }

        let index = elementToLast2(head: head!.next, kth: kth) + 1

        if index == kth {
            print("\(kth) th to last node is \(head!.item)")
        }

        return index
    }

    // Solution 3. CtCI. Recursive. O(n)
    class Index {
        public var value = 0
    }

    static func elementToLast3(head: Node<T>?, kth: Int) -> T? {
        let idx = Index()
        return elementToLast3(head, kth, idx)
    }

    private static func elementToLast3(_ head: Node<T>?, _ kth: Int, _ idx: Index) -> T? {

        guard head != nil else { return nil }

        let nodeItem = elementToLast3(head?.next, kth, idx)

        idx.value += 1

        if idx.value == kth {
            return head?.item
        }

        return nodeItem
    }

    // Solution 4. CtCI. Iterative. Two pointers. O(n) time and O(1) space
    func elementToLast4(kth: Int) -> T? {

        guard head != nil else { return nil }

        var p1 = head
        var p2 = head

        // Move p1 kth nodes into the list
        for _ in 0 ..< kth {

            if p1 == nil { // Out of bounds
                return nil
            }

            p1 = p1!.next
        }

        // Move them at the same pace. When p1 hits the end, p2 will be at the needed element

        while p1 != nil {
            p1 = p1!.next
            p2 = p2?.next
        }
        return p2?.item
    }

    // * 2.3. Delete Middle Node. Given only access to that node
    // * Hints: 72
    // Solution 1. CtCI
    func deleteMiddleNode(_ n: Node<T>?) -> Bool {
        if n == nil || n!.next == nil {
            return false
        }

        let next = n!.next!

        n!.item = next.item
        n!.next = next.next

        return true
    }

    // * 2.4. Partition.
    // * Hints: 3, 24
    // Solution 1. CtCI
    func partition1(node: Node<T>, x: T) -> Node<T>? {
        var node: Node<T>? = node

        var beforeStart: Node<T>? = nil
        var beforeEnd: Node<T>? = nil
        var afterStart: Node<T>? = nil
        var afterEnd: Node<T>? = nil

        // Partition list
        while node != nil {
            let next = node!.next
            node!.next = nil

            if node!.item < x {
                // Insert node into end of before list
                if beforeStart == nil {
                    beforeStart = node
                    beforeEnd = beforeStart
                } else {
                    beforeEnd?.next = node
                    beforeEnd = node
                }
            } else {
                // Insert node into end of after list
                if afterStart == nil {
                    afterStart = node
                    afterEnd = afterStart
                } else {
                    afterEnd?.next = node
                    afterEnd = node
                }
            }

            node = next
        }

        if beforeStart == nil {
            return afterStart
        }

        // Merge before list and after list
        beforeEnd?.next = afterStart
        return beforeStart
    }

    // Solution 2. CtCI. Optimized
    func partition2(node: Node<T>, x: T) -> Node<T>? {
        var head = node
        var tail = node

        var node: Node<T>? = node

        while node != nil {
            let next = node!.next

            if node!.item < x {
                // Insert node at head
                node!.next = head
                head = node!
            } else {
                // Insert node at tail
                tail.next = node
                tail = node!
            }
            node = next
        }
        tail.next = nil

        // The head has changed, so we need to return it to the user
        return head
    }

}
