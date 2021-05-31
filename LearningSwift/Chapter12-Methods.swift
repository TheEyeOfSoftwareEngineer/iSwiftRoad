//
//  Cahpter12-Methods.swift
//  LearningSwift
//
//  Created by yao on 31/5/21.
//

import Foundation

// MARK: Method refresher
var numbers = [1, 2, 3]
numbers.removeLast()
numbers // [1, 2]

// MARK: COmparing methods to computed properties

// MARK: Turning a function into a method
let months = ["January", "Februaty", "March", "April", "May", "June",
              "July", "August", "September", "October", "November", "December"]

struct SimpleDate {
    var month: String
}

func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: date.month)!
}

struct SimpleDate {
    var month: String
    
    func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: date.month)!
    }
}

let date = SimpleDate(month: "October")
date.monthsUntilWinterBreak(from: date) // 2

// MARK: Introducing self
func monthsUntilWinterBreak() -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: self.month)!
}

func monthsUntilWinterBreak() -> Int {
    months.firstIndex(of: "December")! -
    months.firstIndex(of: month)!
}

// MARK: Introducing initializers
let date = SimpleDate(month: "October")
// Error
let date = SimpleDate()

struct SimpleDate {
    var month: String
    
    init() {
        month = "January"
    }
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
}

let date = SimpleDate()
date.month // January
date.monthsUntilWinterBreak() // 11

// MARK: Initializers in structure
struct SimpleDate {
    var month: String
    var day: Int
    
    init() {
        month = "January"
        day = 1
    }
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
}

// Error!
let valentinesDay = SimpleDate(month: "February",
                               day: 14)

init(month: String, day: Int) {
    self.month = month
    self.day = day
}

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month // February
valentinesDay.day // 14

// MARK: DEfault values and initializers
struct SimpleDate {
    var month = "January"
    var day = 1
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
}

let newYearsDay = SimpleDate()
newYearsDay.month // January
newYearsDay.day // 1

let valentinesDay = SimpleDate(month: "February", day: 14)
valentinesDay.month // February
valentinesDay.day // 14

let octoberFirst = SimpleDate(month: "October")
octoberFirst.month // October
octoberFirst.day // 1

let januaryTwentySecond = SimpleDate(day: 22)
januaryTwentySecond.month // January
januaryTwentySecond.day // 22

// MARK: Introducing mutating methods

// “Methods in structures cannot change the values of the instance without being marked as
// mutating. ”
mutating func advance() {
    day += 1
}

// MARK: Type Methods
struct Math {
    static func factorial(of number: Int) -> Int {
        (1...number).reduce(1, *)
    }
}

Math.factorial(of: 6) // 720

// MARK: Adding to an existing structure with extensions

extension Math {
    static func primeFactors(of value: Int) -> [Int] {
        var remainingValue = value
        var testFactor = 2
        var primes: [Int] = []
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primes.append(testFactor)
                remainingValue /= testFactor
            }
            else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primes.appen(remainingValue)
        }
        return primes
    }
}

// MARK: Keeping the compiler-generated initializer using extensions
struct SimpleDate {
    var month = "January"
    var day = 1
    
    func monthsUntilWinterBreak() -> Int {
        months.firstIndex(of: "December")! -
        months.firstIndex(of: month)!
    }
    
    mutating func advance() {
        day += 1
    }
}

extension SimpleDate {
    init(month: Int, day: Int) {
        self.month = months[month-1]
        self.day = day
    }
}
