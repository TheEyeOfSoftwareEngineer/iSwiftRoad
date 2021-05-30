//
//  Chapter3-BasicControiFlow.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Comparison operators
let yes: Bool = true
let no: Bool = false
let yes = true
let no = false

// MARK: Boolean operators
let doesOneEqualTwo = (1 == 2)
let doesOneNotEqual = (1 != 2)
let alsoTrue = !(1 == 2)
let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)

// MARK: Boolean logic
let and = true && true
let or = true || false

let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4

let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4

let andOr = (1 < 2 && 3 > 4) || 1 < 4

// MARK: String equaity
let guess = "dog"
let dogEqualsCat = guess == "cat"

// “This syntax checks if one string comes before another alphabetically. In this case, order equals true because "cat" comes before "dog".”
let order = "cat" < "dog"

// MARK: Toggling a bool
var switchState = true
switchState.toggle() // false
switchState.toggle() // true

// MARK: The if statement
if 2 > 1 {
    print("Yes, 2 is greater than 1.")
}

let animal = "Fox"

if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
}

let hourOfDay = 12
var timeOfDay = ""

if hourOfDay < 6 {
    timeOfDay = "Early morning"
} else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
} else if hourOfDay < 20 {
    timeOfDay = "Evening"
} else if hourOfDay < 24 {
    timeOfDay = "Late evening"
} else {
    timeOfDay = "INVALID HOUSR!"
}
print(timeOfDay)

// Short-circuiting
if 1 > 2 && name == "Will" {
    // ...
}
if 1 < 2 || name == "Will" {
    // ...
}

// Encapsulating variables
var hourWorked = 45
var price = 0

if hourWorked > 40 {
    let hoursOver40 = hourWorked - 40
    price += hoursOver40 * 50
    hourWorked -= hoursOver40
}
price += hourWorked * 25
print(price) // 1250

// The ternary conditional operator
let a = 5
let b = 10
let min: Int
if a < b {
    min = a
} else {
    min = b
}
let max: Int
if a > b {
    max = a
} else {
    max = b
}

// (<CONDITION> ? <TRUE VALUE> : <FALSE VALUE>)

let a = 5
let b = 10
let min = a < b ? a : b
let max = a > b ? a : b

// MARK: Loops
"""
while <CONDITION> {
    <LOOP CODE>
}
"""

while true {}

var sum = 1
while sum < 1000 {
    sum = sum + (sum + 1)
}

// MARK: Repeat-while loops
repeat {
    sum = sum + (sum + 1)
} while sum < 100

// MARK: Breaking out of a loop
sum = 1
while true {
    sum = sum + (sum + 1)
    if sum >= 1000 {
        break
    }
}



