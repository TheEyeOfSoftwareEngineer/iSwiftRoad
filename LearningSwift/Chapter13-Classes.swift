//
//  Chapter13-Classes.swift
//  LearningSwift
//
//  Created by yao on 1/6/21.
//

import Foundation

// MARK: Creating classes

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let john = Person(firstName: "Johnny", lastName: "James")

// some differences between a class and a struct:
// The class above defines an initializer that sets both firstName and lastName to initial
// values. Unlike a struct, a class doesn’t provide a memberwise initializer automatically
// — which means you must provide it yourself if you need it. If you forget to provide an
// initializer, the Swift compiler will flag that as an error

// MARK: Reference types

class SimpleDate {
    let name: String
    init(name: String) {
        self.name = name
    }
}

var var1 = SimpleDate(name: "John")

var var2 = var1
// var1 -> john
// var2 -> john

struct SimplePerson {
    let name: String
}

// struct: value type
// class:  reference type

// MARK: The heap and the stack

// When you create a reference type such as class, the system stores the actual instance in
//a region of memory known as the heap.
// Instances of a value type such as a struct resides in a region of memory called the
//stack, unless the value is part of a class instance, in which case the value is stored
//on the heap with the rest of the class instance.

// MARK: Working with references
struct Location {
    let x: Int
    let y: Int
}

struct DeliverArea {
    var range: Double
    let center: Location
}

var area1 = DeliverArea(range: 2.5,
                        center: Location(x: 2, y: 4))
var area2 = area1
print(area1.range) // 2.5
print(area2.range) // 2.5


area1.range = 4
print(area1.range) // 4.0
print(area2.range) // 2.5

var homeOwner = john
john.firstName = "John"
john.firstName // "John"
homeOwner.firstName // "John"

// MARK: Object identity
john === homeOwner // true

let imposterJohn = Person(firstName: "Johnney",
                          lastName: "Appleseed")
john === homeOwner // true
john === imposterJohn // false
imposterJohn === homeOwner // false

// Assignment of existing variables changes the instances the variables reference.
homeOwner = imposterJohn
john === homeOwner // false

homeOwner = john
john === homeOwner // true

// Create fake, imposter Johns. Use === to see if any of these imposters are our real John.
var imposters = (0...100).map { _ in
  Person(firstName: "John", lastName: "Appleseed")
}

// Equality (==) is not effective when John cannot be identified by his name alone
imposters.contains {
  $0.firstName == john.firstName && $0.lastName == john.lastName
} // true

// Check to ensure the real John is not found among the imposters.
imposters.contains {
  $0 === john
} // false

// Now hide the "real" John somewhere among the imposters.
imposters.insert(john, at: Int.random(in: 0..<100))

// John can now be found among the imposters.
imposters.contains {
  $0 === john
} // true

// Since `Person` is a reference type, you can use === to grab the real John out of the list of imposters and modify the value.
// The original `john` variable will print the new last name!
if let indexOfJohn = imposters.firstIndex(where:
                                          { $0 === john }) {
  imposters[indexOfJohn].lastName = "Bananapeel"
}

john.fullName // John Bananapeel

// MARK: Methods and mutability
struct Grade {
    let letter: String
    let points: Double
    let credits: Double
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
var math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)
//Note that recordGrade(_:) can mutate the array grades by adding more values to the end.
//Although this mutates the current object, the keyword mutating is not required.

// MARK: Mutabilty and constants
// Error: jane is a `let` constant
jane = Student(firstName: "John", lastName: "Appleseed")

var jane = Student(firstName: "Jane", lastName: "Appleseed")
jane = Student(firstName: "John", lastName: "Appleseed")

// MARK: Understanding state and side effects
//The result of this sharing is that class instances have state. Changes in state can
//sometimes be obvious, but often they’re not.

var credits = 0.0

func recordGrade(_ grade: Grade) {
    grades.append(grade)
    credits += grade.credits
}

jane.credits // 7.0

// The teacher made a mistake; math has 5 credits
math = Grade(letter: "A", points: 20.0, credits: 5.0)
jane.recordGrade(math)

jane.credits // 12, not 8!

// MARK: Extending a class using an extension
extension Student {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}
//Functionality can also be added to classes using inheritance. You can even add new stored
//properties to inheriting classes.

// MARK: When to use a class versus a struct
// Values vs. objects

//An object is an instance of a reference type, and such instances have identity meaning
//that every object is unique. No two objects are considered equal simply because they hold
//the same state. Hence, you use === to see if objects are truly equal and not just
//containing the same state. In contrast, instances of value types, which are values, are
//considered equal if they are the same value.

//For example: A delivery range is a value, so you implement it as a struct. A student is
//an object so you implement it as a class. In non-technical terms, no two students are
//considered equal, even if they have the same name!

// Speed
//Speed considerations are a thing, as structs rely on the faster stack while classes rely
//on the slower heap. If you’ll have many more instances (hundreds and greater), or if these
//instances will only exist in memory for a short time — lean towards using a struct. If
//your instance will have a longer lifecycle in memory, or if you’ll create relatively few
//instances, then class instances on the heap shouldn’t create much overhead.

//For instance, you’d use a struct to calculate the total distance of a running route using
//many GPS-based waypoints, such as the Location struct you used in Chapter 10,
//“Structures”. You’ll create many waypoints, but they’ll be created and destroyed
//quickly as you modify the route.

//You could also use a class for an object to store route history, as there would be only
//one object for each user, and you’d likely use the same history object for the user’s
//lifetime.

// Minimalist approach
//Another approach is to use only what you need. If your data will never change or you need
//a simple data store, then use structures. If you need to update your data and you need it
//to contain logic to update its own state, then use classes. Often, it’s best to begin with
//a struct. If you need the added capabilities of a class sometime later, then you just
//convert the struct to a class.

// MARK: Structures vs. classes
// Structures
// - Useful for representing values
// - Implicit copying of values
// - Becomes completely immutable when declared with let
// - Fast memory allocation (stack)

// Classes
// - Useful for representing objects wirh an identity
// - Implicit sharing of objects
// - Internals can remain mutable even when declared with let
// - Slower memory allocation (heap)
