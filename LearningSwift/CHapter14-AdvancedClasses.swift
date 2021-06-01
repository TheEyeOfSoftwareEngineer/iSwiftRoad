//
//  CHapter14-AdvancedClasses.swift
//  LearningSwift
//
//  Created by yao on 1/6/21.
//

import Foundation

// MARK: Introducing inheritance
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
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

class Student: Person {
    var grades: [Grade] = []
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

let john = Person(firstName: "Johnney", lastName: "Appleseed")
let jane = Student(firstName: "Jane", lastName: "Appleseed")

john.firstName // "Johnney"
jane.firstName // "Jane"

let history = Grade(letter: "B", points: 9.0, credits: 3.0)
jane.recordGrade(history)
// john.recordGrade(history) // john is not a student!

//A class that inherits from another class is known as a subclass or a derived class, and
//the class from which it inherits is known as a superclass or a base class.

//The rules for subclassing are fairly simple:
//- A Swift class can inherit from only one other class, a concept known as single
//inheritance.
//- There’s no limit to the depth of subclassing, meaning you can subclass from a class that
//is also a subclass, like below:

class BandMember: Student {
    var minimumPracticeTime = 2
}

class OboePlayer: BandMember {
    override var minimumPracticeTime: Int {
        get {
            super.minimumPracticeTime * 2
        }
        set {
            super.minimumPracticeTime = newValue / 2
        }
    }
}

//A chain of subclasses is called a class hierarchy. In this example, the hierarchy would
//be OboePlayer -> BandMember -> Student -> Person. A class hierarchy is analogous to a
//family tree. Because of this analogy, a superclass is also called the parent class of its
//child class.

// MARK: Polymorphism
//The Student/Person relationship demonstrates a computer science concept known as
//polymorphism. In brief, polymorphism is a programming language’s ability to treat an
//object differently based on context.

func phonebookName(_ person: Person) -> String {
    "\(person.lastName), \(person.firstName)"
}

let person = Person(firstName: "John", lastName: "Appleseed")
let OboePlayer = OboePlayer(firstName: "Jane", lastName: "Appleseed")

phonebookName(person) // Appleseed, John
phonebookName(OboePlayer) // Appleseed, Jane

// MARK: Runtime hierarchy checks
var hallMonitor = Student(firstName: "Jill", lastName: "Bananapeet")

hallMonitor = OboePlayer
//Because hallMonitor is defined as a Student, the compiler won’t allow you to attempt
//calling properties or methods for a more derived type.

//Swift provides the as operator to treat a property or a variable as another type:
//- as: Cast to a specific type that is known at compile-time to succeed, such as casting to a supertype.
//- as?: An optional downcast (to a subtype). If the downcast fails, the result of the
//expression will be nil.
//- as!: A forced downcast. If the downcast fails, the program will crash. Use this rarely,
//and only when you are certain the cast will never fail.

//oboePlayer as Student
//(oboePlayer as Student).minimumPracticeTime // ERROR: No longer a band member!
//
//hallMonitor as? BandMember
//(hallMonitor as? BandMember)?.minimumPracticeTime // 4 (optional)
//
//hallMonitor as! BandMember // Careful! Failure would lead to a runtime crash.
//(hallMonitor as! BandMember).minimumPracticeTime // 4 (force unwrapped)

if let hallMonitor = hallMonitor as? BandMember {
  print("This hall monitor is a band member and practices
         at least \(hallMonitor.minimumPracticeTime)
         hours per week.")
}

//Swift has a strong type system, and the interpretation of a specific type can have an
//effect on static dispatch, aka the process of deciding of which operation to use at
//compile-time.

func afterClassActivity(for student: Student) -> String {
    "Goes home!"
}

func afterClassActivity(for student: BandMember) -> String {
    "Goes to practice!"
}

afterClassActivity(for: oboePlayer) // Goes to practice!
afterClassActivity(for: oboePlayer as Student) // Goes home!

// MARK: Inheritance, methods and overrides
class StudnetAthlete: Student {
    var failedClasses: [Grade] = []
    
    override func recordGrade(_ grade Grade) {
        super.recordGrade(grade)
        
        if grade.letter == "F" {
            failedClasses.append(grade)
        }
    }
    
    var isEligible: Bool {
        failedClasses.count < 3
    }
}

//In this example, the StudentAthlete class overrides recordGrade(_:) so it can keep track
//of any courses the student has failed. StudentAthlete has isEligible, its own computed
//property, that uses this information to determine the athlete’s eligibility.

//When overriding a method, use the override keyword before the method declaration.

// MARK: Introducing super

//Although it isn’t always required, it’s often important to call super when overriding a
//method in Swift. The super call is what will record the grade itself in the grades array,
//because that behavior isn’t duplicated in StudentAthlete. Calling super is also a way of
//avoiding the need for duplicate code in StudentAthlete and Student.

// MARK: When to call super

override func recordGrade(_ grade: Grade) {
  var newFailedClasses: [Grade] = []
  for grade in grades {
    if grade.letter == "F" {
      newFailedClasses.append(grade)
    }
  }
  failedClasses = newFailedClasses

  super.recordGrade(grade)
}

//It’s best practice to call the super version of a method first when overriding. That way,
//the superclass won’t experience any side effects introduced by its subclass, and the
//subclass won’t need to know the superclass’s implementation details.

// MARK: Preventing inheritance

final class FinalStudent: Person {}
class FinalStudentAthlete: FinalStudent {} // Build Error

class AnotherStudent: Person {
    final func recordGrade(_ grade: Grade) {}
}

class AnotherStudentAthlete: AnotherStudent {
    override func recordGrade(_ grade: Grade) {} // Build Error
}

// MARK: Inheritance and class initialization
class StudentAthlete: Student {
    var sports: [String]
    // ...
}

class StudentAthlete: Student {
    var sports: [String]
    
    init(sports: [String]) {
        self.sports = sports
        // Build error - super.init isn't called before
        // returning from initializer
    }
    // ...
}

//Initializers in subclasses are required to call super.init because without it, the
//superclass won’t be able to provide initial states for all its stored properties — in this
//case, firstName and lastName.

class StudentAthlete: Student {
    var sports: [String]
    
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
    }
    // ...
}

//The initializer now calls the initializer of its superclass, and the build error is gone.

//Notice that the initializer now takes in a firstName and a lastName to satisfy the
//requirements for calling the Person initializer.

// MARK: Two-phase Initialization

//Because of Swift’s requirement that all stored properties have initial values,
//initializers in subclasses must adhere to Swift’s convention of two-phase initialization.

//- Phase one: Initialize all of the stored properties in the class instance, from the
//bottom to the top of the class hierarchy. You can’t use properties and methods until phase
//one is complete.

//- Phase two: You can now use properties, methods and initializations that require the use
//of self.

class StudentAthlete: Student {
    var sports: [String]
    
    init(firstName: String, lastName: String, sports: [String]) {
        self.sports = sports
        
        let passGrade = Grade(letter: "P", points: 0.0, credits: 0.0)
        
        super.init(firstName: firstName, lastName: lastName)
        
        recordGrade(passGrade)
    }
    
    // ...
}

//1. First, you initialize the sports property of StudentAthlete. This is part of the first
//phase of initialization and has to be done early, before you call the superclass
//initializer.

//2. Although you can create local variables for things like grades, you can’t call
//recordGrade(_:) yet because the object is still in the first phase.

//3. Call super.init. When this returns, you know that you’ve also initialized every class
//in the hierarchy, because the same rules are applied at every level.

//4. After super.init returns, the initializer is in phase 2, so you call recordGrade(_:).

// summary: we can use the method of the superclass after the initialization

// MARK: Required and convenience initializars

class Student {
    let firstName: String
    let lastName: String
    var grades: [Grade] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(transfer: Student) {
        self.firstName = transfer.firstName
        self.lastName = transfer.lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
}

class Student {
    let firstName: String
    let lastName: String
    var grades: [String]
    
    required init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    // ...
}

//In the modified version of Student above, the first and last name-based initializer has
//been marked with the keyword required. This keyword will force all subclasses of Student
//to implement this initializer.

class StudnetAthlete: Student {
    // Now required by the compiler
    required init(firstName: String, lastName: String) {
        self.sports = []
        super.init(firstName: firstName, lastName: lastName)
    }
    
    // ...
}

//Notice how the override keyword isn’t required with required initializers. In its place,
//the required keyword must be used to make sure that any subclass of StudentAthlete still
//implements this required initializer.

class Student {
    
    convenience init(transfer: Student) {
        self.init(firstName: transfer.firstName,
                  lastName: transfer.lastName)
    }
    // ...
}

//The compiler forces a convenience initializer to call a non-convenience initializer
//(directly or indirectly), instead of handling the initialization of stored properties
//itself. A non-convenience initializer is called a designated initializer and is subject to
//the rules of two-phase initialization. All initializers you’ve written in previous
//examples were in fact designated initializers.

//summary of the compiler rules for using designated and convenience initializers:

//1. A designated initializer must call a designated initializer from its immediate
//superclass.
//
//2. A convenience initializer must call another initializer from the same class.
//
//3. A convenience initializer must ultimately call a designated initializer.

// MARK: When and why to subclass

class Student {
    var grades: [Grade]
    var sports: [Sport]
    // ...
}

// MARK: Single reponsibility

// Strong types
class Team {
    var players: [StudnetAthlete] = []
    
    var isEligible: Bool {
        for player in players {
            if !player.isEligible {
                return false
            }
        }
        return true
    }
}

// shared base classes

class Button {
    func press() {}
}

class Image {}

class ImageButton: Button {
    var image: Image
    init(image: Image) {
        self.image = image
    }
}

class TextButton: Button {
    var text: String
    init(text: String) {
        self.text = text
    }
}

// Extensibility

// Identity

// MARK: Understanding the class lifestyle

var someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Person object has a reference count of 1 (someone variable)

var anotherSomeone: Person? = someone
// Reference count 2 (someone, anotherSomeone)

var lotsOfPeople = [someone, someone, anotherSomeone, someone]
// Reference count 6 (someone, anotherSomeone, 4 references in lotsOfPeople)

anotherSomeone = nil
// Reference count 5 (someone, 4 references in lotsOfPeople)

lotsOfPeople = []
// Reference count 1 (someone)

someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Reference count 0 for the original Person object!
// Variable someone now references a new object”

//In this example, you don’t have to do any work yourself to increase or decrease the
//object’s reference count. That’s because Swift has a feature known as automatic reference
//counting or ARC.

// MARK: Deinitialization

//A deinitializer is a special method on classes that runs when an object’s reference count
//reaches zero, but before Swift removes the object from memory.

class Person {
    deinit {
        print("\(firstName) \(lastName) is being removed from memory!")
    }
}

// MARK: Retain cycles and weak references
//Because classes in Swift rely on reference counting to remove them from memory, it’s
//important to understand the concept of a retain cycle.

class Student: Person {
  var partner: Student?
  // original code
  deinit {
    print("\(firstName) is being deallocated!")
  }
}

var alice: Student? = Student(firstName: "Alice",
                              lastName: "Appleseed")
var bob: Student? = Student(firstName: "Bob",
                            lastName: "Appleseed")

alice?.partner = bob
bob?.partner = alice

alice = nil
bob = nil

//Alice and Bob each have a reference to each other, so the reference count never reaches
//zero! To make things worse, by assigning nil to alice and bob, there are no more
//references to the initial objects. This is a classic case of a retain cycle, which leads
//to a software bug known as a memory leak.

//With a memory leak, memory isn’t freed up even though its practical lifecycle has ended.
//Retain cycles are the most common cause of memory leaks. Fortunately, there’s a way that
//the Student object can reference another Student without being prone to retain cycles, and
//that’s by making the reference weak:

class Student: Person {
    weak var partner: Student?
    // ...
}

//This simple modification marks the partner variable as weak, which means the reference in
//this variable will not take part in reference counting. When a reference isn’t weak, it’s
//called a strong reference, which is the default in Swift. Weak references must be declared
//as optional types so that when the object that they are referencing is released, it
//automatically becomes nil.







