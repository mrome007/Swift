//
//  StringLinkedList.swift
//  StringList
//
//  Created by Michael Romero on 11/3/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

class StringLinkedList{
    var listSize: Int!
    var head: Node!
    var tail: Node!
    
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
            
            if head == nil {
                head = newNode
                tail = newNode
            }
            else {
                tail.next = newNode
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
        var cur: Node! = head
        while cur != nil {
            let char: Character = cur.data
            Swift.print(char)
            cur = cur.next
        }
    }
    
    func pushFront(char: Character) {
        let newNode = Node(dat: char)
        if head == nil {
            head = newNode;
            tail = newNode
        }
        else {
            newNode.next = head;
            head = newNode
        }
    }
    
    func pushBack(char: Character) {
        let newNode = Node(dat: char)
        if(head == nil) {
            head = newNode
            tail = newNode
        }
        else {
            tail.next = newNode
            tail = newNode
        }
    }
    
    func popFront() {
        if head == nil {
            return
        }
        
        if head === tail {
            head = nil
            tail = nil
        }
        else {
            head = head.next
        }
    }
    
    func popBack() {
        if head == nil {
            return
        }
        
        if head === tail {
            head = nil
            tail = nil
            return
        }
        
        var cur: Node! = head
        while cur != nil {
            if(cur.next === tail)
            {
                break
            }
            cur = cur.next
        }
        
        cur.next = nil
        tail = cur
    }
    
    func findIndex(char: Character) -> Int {
        var result = 0
        var cur: Node! = head
        while cur != nil {
            let c: Character = cur.data
            if c == char {
                break;
            }
            result = result + 1
            cur = cur.next
        }
        
        if cur == nil {
            result = -1
        }
        
        return result
    }
    
    func findNode(char: Character) -> Node {
        var cur: Node! = head
        while cur != nil {
            let c: Character = cur.data
            if c == char {
                break;
            }
            cur = cur.next
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
            if tail == nil {
                head = newNode
            }
            else {
                tail.next = newNode
            }
            tail = newNode
            return
        }
        
        var count = 0
        var prev: Node! = nil
        var cur: Node! = head
        while cur != nil {
            if count == index {
                break
            }
            count = count + 1
            prev = cur
            cur = cur.next
        }
        
        if prev == nil {
            newNode.next = head
            head = newNode
        }
        else {
            newNode.next = prev.next
            prev.next = newNode
        }
    }
    
    func removeAtIndex(index: Int) {
        if index < 0 || index >= size() {
            return
        }
        
        listSize = listSize - 1
        var count = 0
        var prev: Node! = nil
        var cur: Node! = head
        while cur != nil {
            if count == index {
                break
            }
            count = count + 1
            prev = cur
            cur = cur.next
        }
        
        if prev == nil {
            head = head.next
        }
        else {
            prev.next = cur.next
        }
    }
}
