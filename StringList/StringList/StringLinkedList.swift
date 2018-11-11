//
//  StringLinkedList.swift
//  StringList
//
//  Created by Michael Romero on 11/3/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class StringLinkedList{
    private var listSize: Int
    private var head: Node?
    private var tail: Node?
    
    init() {
        listSize = 0
        head = nil;
        tail = nil;
    }
    
    init(word: String) {
        listSize = word.count
        for i in 0..<word.count {
            let index = word.index(word.startIndex, offsetBy: i)
            let newNode: Node = Node(dat: word[index])
            
            if let _ = head, let t = tail {
                t.next = newNode
                tail = newNode
            }
            else {
                head = newNode
                tail = newNode
            }
        }
    }
    
    func at(index: Int) -> Character {
        if index < 0 && index >= size() {
            return " "
        }
        
        var cur: Node! = head
        var count = 0
        while count < index {
            count = count + 1
            cur = cur.next
        }
        let result: Character = cur.data
        return result
    }
    
    func size() -> Int {
        return listSize;
    }
    
    func empty() -> Bool {
        return head == nil && tail == nil
    }
    
    func clear() {
        head = nil
        tail = nil
        listSize = 0
    }
    
    func print() {
        var cur = head
        while let c = cur {
            let char: Character = c.data
            Swift.print(char)
            cur = c.next
        }
    }
    
    func pushFront(char: Character) {
        let newNode = Node(dat: char)
        if let _ = head {
            newNode.next = head
            head = newNode
        }
        else {
            head = newNode;
            tail = newNode
        }
    }
    
    func pushBack(char: Character) {
        let newNode = Node(dat: char)
        if let _ = head, let t = tail {
            t.next = newNode
            tail = newNode
        }
        else {
            head = newNode
            tail = newNode
        }
    }
    
    func popFront() {
        if let h = head {
            if head === tail {
                head = nil
                tail = nil
            }
            else {
                head = h.next
            }
        }
        else {
            return;
        }
    }
    
    func popBack() {
        if let _ = head, head !== tail {
            var cur = head
            while let c = cur {
                if(c.next === tail)
                {
                    break
                }
                cur = c.next
            }
            
            if let c = cur {
                c.next = nil
                tail = c
            }
        }
        else {
            head = nil
            tail = nil
            return
        }
    }
    
    func findIndex(char: Character) -> Int {
        var result = 0
        var cur = head
        while let c = cur {
            let ch: Character = c.data
            if ch == char {
                break;
            }
            result = result + 1
            cur = c.next
        }
        
        if let _ = cur {
            
        }
        else {
            result = -1
        }
        
        return result
    }
    
    func findNode(char: Character) -> Node? {
        var cur = head
        while let c = cur {
            let ch: Character = c.data
            if ch == char {
                break;
            }
            cur = c.next
        }
        
        return cur
    }
    
    func insertAtIndex(index: Int, char: Character) {
        if index < 0 {
            return
        }
        
        listSize = listSize + 1
        let newNode = Node(dat: char)
        //if index is greater insert at end of list.
        if index >= size() {
            if let t = tail {
                t.next = newNode
            }
            else {
                head = newNode
            }
            tail = newNode
            return
        }
        
        var count = 0
        var prev: Node? = nil
        var cur = head
        while let c = cur {
            if count == index {
                break
            }
            count = count + 1
            prev = c
            cur = c.next
        }
        
        if let p = prev {
            newNode.next = p.next
            p.next = newNode
        }
        else {
            newNode.next = head
            head = newNode
        }
    }
    
    func removeAtIndex(index: Int) {
        if index < 0 || index >= size() {
            return
        }
        
        listSize = listSize - 1
        var count = 0
        var prev: Node? = nil
        var cur = head
        while let c = cur {
            if count == index {
                break
            }
            count = count + 1
            prev = c
            cur = c.next
        }
        
        if let p = prev, let c = cur {
            p.next = c.next
        }
        else {
            if let h = head {
                head = h.next
            }
        }
    }
}
