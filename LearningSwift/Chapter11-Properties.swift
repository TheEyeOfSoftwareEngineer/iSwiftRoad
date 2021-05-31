//
//  Chapter11-Properties.swift
//  LearningSwift
//
//  Created by yao on 31/5/21.
//

import Foundation

struct Car {
    let make: String
    let color: String
}

// MARK: Stored properties
struct Contact {
    var fullName: String
    var emailAddress: String
}

var person = Contact(fullName: "Will Yao",
                     emailAddress: "123@mil.com")

person.fullName // Will Yao
person.emailAddress // 123@mil.com

person.fullName = "Bill Will"
person.fullName // Bill Will

struct Contact {
    var fullName: String
    let emailAddress: String
}

// Error: cannot assign to a constant
person.emailAddress = "234@gmail.com"

// MARK: Default values
struct Contact {
    var fullName: String
    let emailAddress: String
    var relationship = "Friend"
}

var person = Contact(fullName: "Grace Murray",
                     emailAddress: "grace@navy.mil")
person.relationship // Friend

var boss = Contact(fullName: "Ray Wenderlich",
                   emailAddress: "ray@raywenderlich.com",
                   relationship: "Boss")

// MARK: Computed properties
struct TV {
    var height: Double
    var width: Double
    
    var diagonal: Int {
        let result = (height * height + width * width)
                        .squareRoot().rounded()
        return Int(result)
    }
}

var tv = TV(height: 53.93, width: 95.87)
tv.diagonal // 110

tv.width = tv.height
tv.diagonal // 76

// MARK: Getter and Setter
var diagonal: Int {
    get {
        let result = (height * height + width * width)
                        .squareRoot().rounded()
        return Int(result)
    }
    set {
        // set: oldValue newValue
        let ratioWidth = 16.0
        let ratioHeight = 9.0
        let ratioDiagonal = (ratioWidth * ratioWidth + ratioHeight * ratioHeight).squareRoot()
        height = Double(newValue) * ratioWidth / ratioDiagonal
        width = height * ratioWidth / ratioHeight
    }
}

tv.diagonal = 70
tv.height // 34.32...
tv.width // 61.01

// MARK: Type properties
struct Level {
    let id: Int
    var boss: String
    var unlocked: Bool
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

struct Level {
    // “A type property is declared with the modifier static:”
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool
}

// Error: you can’t access a type property on an instance
let highestLevel = level3.highestLevel

Level.highestLevel // 1

// MARK: Property observers
struct Level {
    static var highestLevel = 1
    let id: Int
    var boss: String
    var unlocked: Bool {
        didSet {
            if unlocked && id > Self.highestLevel {
                Self.highestLevel = id
            }
        }
    }
}

// MARK: Limiting a variable
struct LightBulb {
    static let maxCurrent = 40
    var current = 0 {
        didSet {
            if current > LightBulb.maxCurrent {
                print("""
                      Current is too high,
                      falling back to previous setting
                      """)
                current = oldValue
            }
        }
    }
}

var light = LightBulb()
light.current = 50
light.current // 0
light.current = 40
light.current // 40

// MARK: Lazy properties
struct Circle {
    lazy var pi = {
        ((4.0 * atan(1.0 / 5.0)) -  atan(1.0 / 239.0)) * 4.0
    }
    var radius = 0.0
    var circumference: Double {
        mutating get {
            pi * radius * 2
        }
    }
    init(radius: Double) {
        self.radius = radius
    }
}

var circle = Circle(radius: 5) // got a circle, pi has not been run
circle.circumference // 31.42
// also, pi now has a value

// 1
// Since the value of pi changes, the circumference getter must be marked as mutating.
// Accessing the value of pi changes the value of the structure

// 2
// Since pi is a stored property of the structure, you need a custom initializer to use only
// the radius. Remember the automatic initializer of a structure includes all of the stored
// properties.

//The lazy keyword is a property wrapper. Since lazy is common and has been in use for many
//years, it is afforded the luxury of omitting the @ symbol that usually prefixes property
//wrappers. When you build apps with SwiftUI, you will see many other property wrappers,
//like @State, @Binding, and @EnvironmentObject. Property wrappers allow you to generalize
//behavior so that you can write complex logic once and re-use it. Any property that is
//declared as lazy will make use of the behavior defined in the property wrapper
//definition.

