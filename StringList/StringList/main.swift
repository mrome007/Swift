//
//  main.swift
//  StringList
//
//  Created by Michael Romero on 11/3/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

print("=====================Linked List=====================")
let word: StringLinkedList = StringLinkedList(word: "Hello")
word.print()

print("")

let word1 = StringLinkedList()
word1.pushFront(char: "c")
word1.pushFront(char: "d")
word1.pushBack(char: "x")
word1.popFront()
word1.popBack()
word1.print()

print("")

word.insertAtIndex(index: 3, char: "z")
word.insertAtIndex(index: 0, char: "z")
word.insertAtIndex(index: 5, char: "z")
word.print()

print("")
word.removeAtIndex(index: 0)
word.removeAtIndex(index: 6)
word.print()
print(word.findIndex(char: "y"))

print("=====================Stack=====================")
let stk: StackLinkedList = StackLinkedList()
stk.push(char: "M")
stk.push(char: "i")
stk.push(char: "c")
stk.push(char: "h")
stk.push(char: "a")
stk.push(char: "e")
stk.push(char: "l")

print("Printing elements in the stack.")
while !stk.empty() {
    print(stk.pop())
}

print("Top of stack after pushing M")
stk.push(char: "M")
print(stk.top())

print("=====================Queue=====================")
let que: QueueLinkedList = QueueLinkedList()
que.enqueue(char: "M")
que.enqueue(char: "i")
que.enqueue(char: "c")
que.enqueue(char: "h")
que.enqueue(char: "a")
que.enqueue(char: "e")
que.enqueue(char: "l")

print("Printing elements in the queue.")
while !que.empty() {
    print(que.dequeue())
}

print("Front of queue after pushing M")
que.enqueue(char: "M")
print(que.front())
que.dequeue()
que.dequeue()
print(que.front())
