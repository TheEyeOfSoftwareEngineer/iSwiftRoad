//
//  Chapter7-Sets.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Sets
// creating sets
let setOne: Set<Int> = [1]

let someArray = [1, 2, 3, 1]
var explictSet: Set<Int> = [1, 2, 3, 1]
var someSet = Set([1, 2, 3, 1])
print(someSet) // “[2, 3, 1] but the order is not defined”

// accessing elements
print(someSet.contains(1)) // true
print(someSet.contains(4)) // false

// adding and removing elements
someSet.insert(5)

let removedElement = someSet.remove(1)
print(removedElement!) // 1


