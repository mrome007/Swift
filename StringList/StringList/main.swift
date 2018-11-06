//
//  main.swift
//  StringList
//
//  Created by Michael Romero on 11/3/18.
//  Copyright © 2018 Michael Romero. All rights reserved.
//

import Foundation

print("Hello, World!")
let word: StringLinkedList = StringLinkedList(word: "Hello")
word.print()

print("")

let word1 = StringLinkedList()
word1.pushFront(char: "c")
word1.pushFront(char: "d")
word1.pushBack(char: "x")
word1.popFront()

print("")

word.insertAtIndex(index: 3, char: "z")
word.insertAtIndex(index: 0, char: "z")
word.insertAtIndex(index: 5, char: "z")
word.print()

print("")
word.removeAtIndex(index: 0)
word.removeAtIndex(index: 6)
word.print()




