//
//  LinkedListNode.swift
//  CtCI Tasks
//
//  Created by nag on 12/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

// === Main Node implementation
class Node<T: Hashable> where T: Comparable {
    var item: T?
    var next: Node?
    
    init(item: T) {
        self.item = item
    }
    
    init() {
        
    }
    
    var count: Int {
        var n = self.next
        var i = 1
        
        while n != nil {
            i += 1
            n = n!.next
        }
        
        return i
    }
    
    
    func appendToTail(item: T) {
        
        let newChild = Node<T>(item: item)
        var n = self
        
        while n.next != nil {
            n = n.next!
        }
        
        n.next = newChild
    }
    
    func appendNodeToTail(node: Node<T>) {
        var n = self
        
        while n.next != nil {
            n = n.next!
        }
        
        n.next = node
    }
    
    func getNode(head: Node<T>?, forItem item: T) -> Node<T>? {
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
    
    func deleteNode(head: Node<T>?, item: T) -> Node<T>? {
        
        guard var n = head else {
            return head
        }
        
        if n.item == item {
            return n.next
        }
        
        while n.next != nil {
            
            if n.next!.item == item {
                n.next = n.next!.next
            }
            
            n = n.next!
        }
        
        return head
    }
    
    //print all keys for the class
    func printAllKeys(head: Node<T>?) {
        
        guard let head = head else { return }
        
        print("\(head.item!)")
        
        var next = head.next
        
        while next != nil {
            print("\(next!.item!)")
            next = next!.next
        }
    }
    
    func getAllKeysString(head: Node<T>?) -> String {
        var outStr = ""
        
        guard let head = head else { return outStr }
        
        outStr += "\(head.item!)"
        
        var next = head.next
        
        while next != nil {
            outStr += "\(next!.item!)"
            next = next!.next
        }
        
        return outStr
    }
    
}

extension Node: Equatable {
    static func ==(lhs: Node<T>, rhs: Node<T>) -> Bool {
        var one: Node<T>? = lhs
        var two: Node<T>? = rhs
        
        while one != nil && two != nil {
            if one!.item! != two!.item! {
                return false
            }
            one = one!.next
            two = two!.next
        }
        return one == nil && two == nil
    }
}

// === Chapter 2. Linked Lists

extension Node {
    // ----------------------------
    // * 2.1. Remove Dups.
    // * Hints: 9, 40
    
    // Solution 1. CtCI. O(N)
    func removeDups1(node: Node<T>?) {
        
        guard node != nil else { return }
        
        var n = node
        var previous: Node<T>? = nil
        
        var checkSet = Set<T>()
        
        while n != nil {
            
            if checkSet.contains(n!.item!) {
                previous?.next = n!.next
            } else {
                checkSet.insert(n!.item!)
                previous = n
            }
            
            n = n!.next
        }
        
    }
    
    // Solution 2. CtCI. No buffer allowed. Two pointers: current which iterates through the linked list, and runner which checks all subsequent nodes for duplicates. Runs in O(1) space, but O(N2) time.
    func removeDups2(head: Node<T>?) {
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
    
    // ----------------------------
    // * 2.2. Return Kth to Last
    // * Hints: 8, 25, 41, 67, 126
    // Solution 1. n0an
    func elementToLast1(head: Node<T>?, kth: Int) -> T? {
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
    
    // Solution 2. CtCI. Recursive. Not returning. Printing kth element
    func elementToLast2(head: Node<T>?, kth: Int) -> Int {
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
    
    func elementToLast3(head: Node<T>?, kth: Int) -> Node<T>? {
        let idx = Index()
        return elementToLast3(head, kth, idx)
    }
    
    private func elementToLast3(_ head: Node<T>?, _ kth: Int, _ idx: Index) -> Node<T>? {
        
        guard head != nil else { return nil }
        
        let node = elementToLast3(head?.next, kth, idx)
        
        idx.value += 1
        
        if idx.value == kth {
            return head
        }
        
        return node
    }
    
    // Solution 4. CtCI. Iterative. Two pointers. O(n) time and O(1) space
    func elementToLast4(head: Node<T>?, kth: Int) -> Node<T>? {
        
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
        return p2
    }
    
    // ----------------------------
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
    
    // ----------------------------
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
            
            if node!.item! < x {
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
            
            if node!.item! < x {
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
    
    // ----------------------------
    // * 2.5. Sum Lists.
    // * Hints: 7, 30, 71, 95, 109
    // Solution 1. n0an. Task 1 (Reversed order)
    static func sumList1a(node1: Node<Int>?, node2: Node<Int>?) -> Node<Int>? {
        
        guard node1 != nil && node2 != nil else { return nil }
        
        var num1: Int? = 0
        var num2: Int? = 0
        
        var str1 = ""
        var str2 = ""
        
        var n1 = node1
        var n2 = node2
        
        while n1 != nil {
            str1 += "\(n1!.item!)"
            n1 = n1!.next
        }
        
        while n2 != nil {
            str2 += "\(n2!.item!)"
            n2 = n2!.next
        }
        
        num1 = Int(String(str1.reversed()))
        num2 = Int(String(str2.reversed()))
        
        guard let num1u = num1, let num2u = num2 else { return nil }
        
        let sum = num1u + num2u
        
        let sumStr = String(sum).reversed()
        
        guard let firstDigit = Int(String(Array(sumStr)[0])) else { return nil }
        
        let outNode = Node<Int>.init(item: firstDigit)
        
        for index in 1 ..< sumStr.count {
            guard let digit = Int(String(Array(sumStr)[index])) else { return nil }
            
            outNode.appendToTail(item: digit)
        }
        
        return outNode
    }
    
    // Solution 1. n0an. Task 2 (Straight order)
    static func sumList1b(node1: Node<Int>?, node2: Node<Int>?) -> Node<Int>? {
        
        guard node1 != nil && node2 != nil else { return nil }
        
        var num1: Int? = 0
        var num2: Int? = 0
        
        var str1 = ""
        var str2 = ""
        
        var n1 = node1
        var n2 = node2
        
        while n1 != nil {
            str1 += "\(n1!.item!)"
            n1 = n1!.next
        }
        
        while n2 != nil {
            str2 += "\(n2!.item!)"
            n2 = n2!.next
        }
        
        num1 = Int(str1)
        num2 = Int(str2)
        
        guard let num1u = num1, let num2u = num2 else { return nil }
        
        let sum = num1u + num2u
        
        let sumStr = String(sum)
        
        guard let firstDigit = Int(String(Array(sumStr)[0])) else { return nil }
        
        let outNode = Node<Int>.init(item: firstDigit)
        
        for index in 1 ..< sumStr.count {
            guard let digit = Int(String(Array(sumStr)[index])) else { return nil }
            
            outNode.appendToTail(item: digit)
        }
        
        return outNode
    }
    
    // Solution 2. CtCI. Task 1 (Reversed order)
    func addLists2a(l1: Node<Int>?, l2: Node<Int>?, carry: Int) -> Node<Int>? {
        if l1 == nil && l2 == nil && carry == 0 {
            return nil
        }
        
        let result = Node<Int>()
        
        var value = carry
        
        if l1 != nil {
            value += l1!.item!
        }
        
        if l2 != nil {
            value += l2!.item!
        }
        
        // Second digit of number
        result.item = value % 10
        
        // Recursive
        if l1 != nil || l2 != nil {
            let more = addLists2a(l1: l1?.next ?? nil, l2: l2?.next ?? nil, carry: value >= 10 ? 1 : 0)
            
            if let more = more { result.appendNodeToTail(node: more) }
        }
        
        return result
    }
    
    // Solution 2. CtCI. Task 2 (Straight order)
    class PartialSum {
        public var sum: Node<Int>? = nil
        public var carry = 0
    }
    
    func addLists2b(l1: Node<Int>?, l2: Node<Int>?, carry: Int) -> Node<Int>? {
        
        guard var l1 = l1, var l2 = l2 else { return nil }
        
        let len1 = l1.count
        let len2 = l2.count
        
        // Pad the shorter list with zeros
        if len1 < len2 {
            l1 = padList(l1, len2 - len1)
        } else {
            l2 = padList(l2, len1 - len2)
        }
        
        // Add lists
        let sum = addListsHelper(l1, l2)
        
        // If there was a carry value left over, insert this at the front of the list. Otherwise, just return the linked list
        
        if sum.carry == 0 {
            return sum.sum
        } else {
            let result = insertBefore(sum.sum, sum.carry)
            return result
        }
    }
    
    func addListsHelper(_ l1: Node<Int>?, _ l2: Node<Int>?) -> PartialSum {
        if l1 == nil && l2 == nil {
            let sum = PartialSum()
            return sum
        }
        
        // Add smaller digits recursively
        let sum = addListsHelper(l1?.next, l2?.next)
        
        // Add carry to current data
        let val = sum.carry + (l1?.item)! + (l2?.item)!
        
        // Insert sum of current digits
        let full_result = insertBefore(sum.sum, val % 10)
        
        // Return sum so far, and the carry value
        sum.sum = full_result
        sum.carry = val / 10
        return sum
    }
    
    func padList(_ l: Node<Int>, _ padding: Int) -> Node<Int> {
        var head = l
        
        for _ in 0 ..< padding {
            head = insertBefore(head, 0)
        }
        
        return head
    }
    
    func insertBefore(_ list: Node<Int>?, _ item: Int) -> Node<Int> {
        
        let node = Node<Int>(item: item)
        
        if list != nil {
            node.next = list
        }
        
        return node
    }
    
    // ----------------------------
    // * 2.6. Palindrome
    // * Hints: 5, 13, 29, 61, 101
    // Solution 1. CtCI
    func isPalindrome1(_ head: Node<T>?) -> Bool {
        let reversed = reverseAndClone(head)
//        return isEqual(head, reversed)
        return head == reversed
    }
    
    func reverseAndClone(_ node: Node<T>?) -> Node<T>? {
        var node = node
        
        var head: Node<T>? = nil
        
        while node != nil {
            let n = Node(item: node!.item!) // Clone
            n.next = head
            head = n
            node = node!.next
        }
        return head
    }
    
    // Solution 2. CtCI
    func isPalindrome2(_ head: Node<T>?) -> Bool {
        
        var fast = head
        var slow = head
        
        let stack = Stack<T>()
        
        while fast != nil && fast!.next != nil {
            stack.push(slow!.item!)
            slow = slow!.next
            fast = fast?.next?.next
        }
        
        // Odd number of elements, skip middle element
        if fast != nil {
            slow = slow!.next
        }
        
        while slow != nil {
            let top = stack.pop()
            
            // If values are different then it's not a palindrome
            if top! != slow!.item! {
                return false
            }
            
            slow = slow?.next
        }
        
        return true
    }
    
    // Solution 3. CtCI. Recursive
    struct ResultPalindrome {
        public var node: Node<T>?
        public var result: Bool?
        
    }
    
    func isPalindrome3(_ head: Node<T>?) -> Bool {
        guard head != nil else {
            return false
        }
        
        let length = head!.count
        
        let p = isPalindromeRecurse(head!, length)
        return p.result!
        
    }
    
    func isPalindromeRecurse(_ head: Node<T>?, _ length: Int) -> ResultPalindrome {
        if head == nil || length <= 0 { // Even number of nodes
            return ResultPalindrome(node: head, result: true)
        } else if length == 1 { // Odd number of nodes
            return ResultPalindrome(node: head!.next, result: true)
        }
        
        // Recurse on sublist
        var res = isPalindromeRecurse(head!.next, length - 2)
        
        // If child calls are not a palindrome, pass back up a failure
        if !res.result! || res.node == nil {
            return res
        }
        
        // Check if matches corresponding node on other side
        res.result = head!.item! == res.node!.item!
        
        // Return corresponding node
        res.node = res.node!.next
        
        return res
    }
    
//    func lengthOfList(_ n: Node<T>?) {
//        var n = n
//        var size = 0
//
//        while n != nil {
//            size += 1
//            n = n!.next
//        }
//        return size
//    }
    
//    func isEqual(_ one: Node<T>?, _ two: Node<T>?) -> Bool {
//        var one = one
//        var two = two
//
//        while one != nil && two != nil {
//            if one!.item! != two!.item! {
//                return false
//            }
//            one = one!.next
//            two = two!.next
//        }
//        return one == nil && two == nil
//    }
    
    // * 2.7. Intersection
    // * Hints: 20, 45, 55, 65, 76, 93, 111, 120, 129
    // Solution 1. n0an. O(n²)
    func getIntersection1(l1: Node<T>, l2: Node<T>) -> Node<T>? {
        
        var headL1: Node<T>? = l1
        
        while headL1 != nil {
            
            var headL2: Node<T>? = l2
            
            while headL2 != nil {
                
                if headL2 === headL1 {
                    return headL2
                }
                
                headL2 = headL2!.next
            }
            headL1 = headL1!.next
        }
        
        return nil
    }
    
    // Solution 2. CtCI. O(A + B)
    func getIntersection2(list1: Node<T>?, list2: Node<T>?) -> Node<T>? {
        guard list1 != nil && list2 != nil else { return nil }
        
        // Get tail and sizes
        guard let result1 = getTailAndSize(list: list1) else { return nil }
        guard let result2 = getTailAndSize(list: list2) else { return nil }

        // If different tails - no intersection
        if result1.tail != result2.tail {
            return nil
        }
        
        // Set pointers to the start of eatch linked list
        var shorter = result1.size! < result2.size! ? list1 : list2
        var longer = result1.size! < result2.size! ? list2 : list1
        
        // Advance the pointer for the longer linked list by diff in lengths
        longer = getKthNode(longer, abs(result1.size! - result2.size!))
        
        // Move both pointers until you have a collision
        while shorter != longer {
            shorter = shorter!.next
            longer = longer!.next
        }
        
        // Return either one
        return longer
    }
    
    struct ResultIntersection {
        var tail: Node<T>?
        var size: Int?
    }
    
    func getTailAndSize(list: Node<T>?) -> ResultIntersection? {
        if list == nil { return nil }
        
        var size = 1
        var current = list
        
        while current != nil {
            size += 1
            current = current!.next
        }
        
        return ResultIntersection(tail: current, size: size)
    }
    
    func getKthNode(_ head: Node<T>?, _ k: Int) -> Node<T>? {
        var current = head
        var k = k
        
        while k > 0 && current != nil {
            current = current!.next
            k -= 1
        }
        return current
    }
    
    // ----------------------------
    // * 2.8. Loop Detection
    // * Hints: 50, 69, 83, 90
    // Solution 1. n0an
    func loopDetection(_ head: Node<T>?) -> Node<T>? {
        
        guard head != nil else { return nil }
        
        var slow = head
        var fast = head
        
        // Find meeting point. This will be LOOP_SIZE - k steps into the linked list.
        mainLoop: while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            
            if slow === fast { // Collision detected
                break mainLoop
            }
        }
        
        // Error check - no meeting point, no loop
        if fast == nil || fast!.next == nil {
            return nil
        }
        
        // Move slow pointer to Head. Keep fast at Meeting Point. Each are k steps from the Loop Start. If they move at the same pace, they must meet at Loop Start.
        slow = head
        
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        
        // Both now point to the start of the loop
        return fast
    }
}


