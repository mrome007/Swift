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
}
