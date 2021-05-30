//
//  Chapter8-CollectionIterationWithClosures.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Collection Iteration with Closures
// Closure basics
var multiplyClosure: (Int, Int) -> Int
var multiplyClosure = { (a: Int, b: Int) -> Int In
    return a * b
}

let result = multiplyClosure(4, 2)

// Shorthand syntax
multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}

multiplyClosure = { (a, b) in
    a * b
}

multiplyClosure = {
    $0 * $1
}

func operateOnNumber(_ a: Int, _b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}


let addFunction(_ a: Int, _ b: Int) -> Int {
    a + b
}
operateOnNumber(4, 2, operation: addFunction)

operateOnNumber(4, 2, operation: { (a: Int, b: Int) -> Int in
    return a + b
})

operateOnNumber(4, 2, operation: { $0 + $1 })

operateOnNumber(4, 2, operation: +)

operateOnNumber(4, 2) {
    $0 + $1
}

// Multiple trailing closures syntax
func sequenced(first: ()->Void, sencond: ()->Void) {
    first()
    sencond()
}

sequenced {
    print("Hello, ", terminator: "")
} sencond: {
    print("world.")
}

// Closures wirh no return value
let voidClosure: () -> Void = {
    print("Swift is awesome!")
}
voidClosure()

// Capturing from the  enclosing scope
var counter = 0
let incrementCounter = {
    counter += 1
}

func countingClosure() -> () -> Int {
    var counter = 0
    let incrementCounter: () -> Int = {
        counter += 1
        return counter
    }
    return incrementCounter
}

let counter1 = countingClosure()
let counter2 = countingClosure()

counter1() // 1
counter2() // 1
counter1() // 2
counter1() // 3
counter2() // 2

// Custom sorting with closures
let names = ["ZZZZZZ", "BB", "A", "CCCC", "EEEEE"]
names.sorted() // ["A", "BB", "CCCC", "EEEEE", "ZZZZZZ"]

names.sorted {
    $0.count > $1.count
}

// Iteraing over collections with closures
let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0): \($0*$0)")
}

var prices = [1.5, 10, 4.99, 2.30, 8.19]
//“func filter(_ isIncluded: (Element) -> Bool) -> [Element]”
let largePrices = prices.filter {
    $0 > 5
}

let largePrice = prices.first {
    $0 > 5
}

let salePrices = prices.map {
    $0 * 0.9
}

let userInput = ["0", "11", "haha", "42"]
let numbers1 = userInput.map {
    Int($0)
}
let numbers2 = userInput.compactMap {
    Int($0)
}

let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐕"]]
let allUserInput = userInputNested.flatMap {
  $0
} // “["0", "1", "a", "b", "c", "🐕"].”

let sum = prices.reduce(0) {
    $0 + $1
} // 26.98

let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
  $0 + $1.key * Double($1.value)
} // 384.5

let farmAnimals = ["🐎": 5, "🐄": 10, "🐑": 50, "🐶": 1]
let allAnimals = farmAnimals.reduce(into: []) {
  (result, this: (key: String, value: Int)) in
  for _ in 0 ..< this.value {
    result.append(this.key)
  }
}

var prices = [1.5, 10, 4.99, 2.30, 8.19]
let removeFirst = prices.dropFirst() // “[10, 4.99, 2.30, 8.19]”
let removeFirstTwo = prices.dropFirst(2) // [4.99, 2.30, 8.19]

let removeLast = prices.dropLast() // [1.5, 10, 4.99, 2.30]
let removeLastTwo = prices.dropLast(2) // [1.5, 10, 4.99]

let firstTwo = prices.prefix(2) // [1.5, 10]
let lastTwo = prices.suffix(2) // [2.30, 8.19]

prices.removeAll() { $0 > 2} // [1.5]
prices.removeAll() // []

// Lazy collections
func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    if number == 2 || number == 3 { return true }
    
    for i in 2...Int(Double(number).squareRoot()) {
        if number % i == 0 { return false }
    }
    
    return true
}

var primes: [Int] = []
var i = 1
while primes.count < 10 {
    if isPrime(i) {
        primes.append(i)
    }
    i += 1
}
primes.forEach { print($0) }

let primes = (1...).lazy
    .filter { isPrime($0) }
    .prefix(10)
primes.forEach { print($0) }



