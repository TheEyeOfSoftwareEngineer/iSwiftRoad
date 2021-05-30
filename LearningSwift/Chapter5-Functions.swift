//
//  Chapter5-Functions.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARk: Function basics
func printMyName() {
    print("My name is Will")
}
printMyName()

// MARk: Function parameters
func printMultipleOfFive(value: Int) {
    print("\(value) * 5 = \(value * 5)")
}
printMultipleOfFive(value: 10)

func printMultipler(multiplier: Int, andValue: Int) -> void {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipler(multiplier: 4, andValue: 2)

func printMultipler(multiplier: Int, and Value: Int) {
    print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipler(multiplier: 4, and: 2)

func printMultipleOf(_ multiplier: Int, _ value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, 2)

func printMultipleOf(_ multiplier: Int, _ value: Int = 1) {
    print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4)

// MARK: return values
func multiply(_ number: Int, by multiplier: Int) -> Int {
    return number * multiplier
}
let result = multiply(4, by: 2)

func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
    return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quatient = results.quotient

func multiply(_ number: Int, by multiplier: Int) -> Int {
    number * multiplier
}

func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
    (number * factor, number / factor)
}

// MARK: advanced parameter handing
// error situation: value is a constant
// “Left side of mutating operator isn't mutable: 'value' is a 'let' constant”
func incrementAndPrint(_ value: Int) { // pass-by-value
    value += 1
    print(value)
}

// true one

//inout before the parameter type indicates that this parameter should be copied in, that local copy
//used within the function, and copied back out when the function returns.

func incrementAndPrint(_ value: inout Int) { // copy=in copy-out or call by value result
    value += 1
    print(value) // 6
}
var value = 5
incrementAndPrint(&value)
print(value) // 6

// MARK: Ocerloading
func printMultipleOf(multiplier: Int, andValue: Int)
func printMultipleOf(multiplier: Int, and value: Int)
func printMultipleOf(_ multiplier: Int, and value: Int)
func printMultipleOf(_ multiplier: Int, _ value: Int)

/*
This is usually achieved through a difference in the parameter list:
- A different number of parameters.
- Different parameter types.
- Different external parameter names, such as the case with printMultipleOf.
*/

func getValue() -> Int {
  31
}

func getValue() -> String {
  "Will"
}

let value = getValue() // error: ambigious use of 'getValue()'

let valueInt: Int = getValue()
let valueString: String = getValue()

// MARK: Functioons as variables
func add(_ a: Int, _ b: Int) -> Int {
    a + b
}

var function = add
function(4, 2)

func subtract(_ a: Int, _ b: Int) -> Int {
    a - b
}
function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = function(a, b)
    print(result)
}
/*
1. function is of a function type that takes two Int parameters and returns an Int, declared like so: (Int, Int) -> Int.
2. a is of type Int
3. b is of type Int
*/
printResult(add, 4, 2)

// MARK: The land of return
// example1:
//“fatalError("reason to terminate") is an example of a function like this. It prints the reason for the fatal error and then halts execution to prevent further damage.”
// example2:
//“a non-returning function is one that handles an event loop. An event loop is at the heart of every modern application that takes input from the user and displays things on a screen.”
//“The event loop services requests coming from the user, then passes these events to the application code, which in turn causes the information to be displayed on the screen. The loop then cycles back and services the next event.”

func noReturn() -> Never {
    
}
//“Function with uninhabited return type 'Never' is missing call to another never-returning function on all paths”

func infiniteLoop() -> Never {
    while true {
        
    }
}

// MARK: writing good functions
// commenting your functions

/// Calculates the average of three values
/// - Parameters:
///     - a: The first value.
///     - b: The second value.
///     - b: The third value.
/// - Returns: The average of the three values.
func calculateAverage(of a: Double, and b: Double, and c: Double) -> Double {
    let total = a + b + c
    let average = total / 3
    return average
}
calculateAverage(of: 1, and: 3, and: 5)


