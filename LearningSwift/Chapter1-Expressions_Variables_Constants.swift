//
//  Chapter1-Expressions_Variables_Constants.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Code Comments
// This is a comment. It is not executed.
/*
 This is another comment. It is not executed.
 */

// MARK: Printing out
print("Hello, Swift")

// MARK: Arithmetic operation

// Simple operations
// Add: +
2 + 6
// Substracr: -
10 - 2
// Multiply: +
2 * 4
// Divide: /
24 / 3

// Decimal numbers
22 / 7 // result: 3
22.0 / 7.0 // result: 3.142857...

// The remainder operation
28 % 10
(28.0).truncatingRemainder(dividingBy: 10.0)

// Shift operation
1 << 3
32 >> 2

// Math function
sin(45 * Double.pi / 180)
cos(135 * Double.pi / 180)
(2.0).squareRoot()
max(5, 10)
min(-5, -10)
max((2.0).squareRoot(), Double.pi / 2)

// Naming data
// Constants
let number: Int = 10
let pi: Double = 3.14159

// Variables
var variableNumber: Int = 42
variableNumber = 0
variableNumber = 1_000_000

// Using meaningful names
personAge
numberOfPeople
gradePointAverage

// Increment and decrement
var counter: Int = 0
counter += 1
counter -= 1
counter = counter + 1
counter = counter - 1
counter = 10
counter *= 3 // 30
counter /= 2 // 15
