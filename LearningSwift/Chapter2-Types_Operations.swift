//
//  Chapter2-Types_Operations.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Type conversion
var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)

// MARK: Operators with mixed types
let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWorked)

// MARK: Type Inference
let wantADouble = 3
let actuallyDouble = Double(3)
let actuallyDouble: Double = 3
let actuallyDouble = 3 as Double

// MARK: Strings

// MARK: Strings in Swift
// Characters and strings
let characterA: Character = "a"
let CharacterDog: Character = "✈️"
let stringDog: String = "Dog"

// Concatenation
var message = "Hello" + " my name is "
let name = "Will"
message += name

let exclamationMark: Character = "!"
message += String(exclamationMark)

// Interpolation
message = "Hello my name is \(name)!"
let oneThird = 1.0 / 3.0
let oneThirdLongStriong = "One third is \(oneThird) as a decimal"

// Multi-line strings
let bigString = """
    You can have a string
    taht contains multiple
    lines
    by
    doing this
"""
print(bigString)

// MARK: Tuples
let coordinates: (Int, Int) = (2, 3)
let coordinates = (2, 3)
let coordinatesDouble = (2.1, 3.5)
let coordinatesMixed = (2.1, 3)

let x1 = coordinates.0
let y1 = coordinates.1

let coordinatesNamed = (x:2, y:3)
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let coordinates3D = (x: 2, y: 3, z: 1)
let x3 = coordinates3D.x
let y3 = coordinates3D.y
let z3 = coordinates3D.z

let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, z3) = coordinates3D

let (x4, y4, _) = coordinates3D

// MARK: The whole of number types
"""
Type    Minumum     Maximum     StorageSize
Int8    -128        127         1
Unit8   0           255         1
Int16   -32768      32767       2
Uint16  0           65535       2
Int32   -2147483648 2147483647  4
Uint32  0           4294967296  4
Int64                           8
Uint64                          8
"""

"""
Type    Minumum     Maximum     Precision       StorageSize
Float   1.17E-38    3.40E+38    6 digits        4
Double  2.22e-308   1.79E+308   15 digits       8
"""

let a: Int16 = 12
let b: UInt5 = 255
let c: Int32 = -100000
let answer: Int = Int(a) + Int(b) + Int(c)

// MARK: Type aliases
typealias Animal = String
ley myDog: Animal = "Dog"

typealias Coordinates = (Int, Int)
let xy: Coordinates = (2, 4)

// MARK: a peek behind the curtains: Protocol
"""
SignedNumberic(Protocol) -> Numberic(Protocol)
^                           ^
|                           |
SignedInteger(Protocol)  -> BinaryInteger(Protocol) <- UnsignedInteger(Protocol)
^                                                      ^
|                                                      |
Int8, Int16, Int32, ...                                Uint8, Uint16, Uint32, ...
"""




