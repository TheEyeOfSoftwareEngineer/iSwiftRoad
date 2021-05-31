//
//  Chapter10-Structures.swift
//  LearningSwift
//
//  Created by yao on 31/5/21.
//

import Foundation

// MARK: Introducing structures
// version1
let restautantLocation = (3, 4)
let restautantRange = 2.5

func distance(from source: (x: Int, y: Int),
              to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location,
                                    to: restautantLocation)
    return deliveryDistance < restautantRange
}

isInDeliveryRange(location: (x: 5, y: 5))

// version2
let restautantLocation = (3, 4)
let restautantRange = 2.5

let otherRestautantLocation = (7, 8)
let otherRestautantRange = 1.5


func distance(from source: (x: Int, y: Int),
              to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location,
                                    to: restautantLocation)
    let secondDeliveryDistance = distance(from: location,
                                          to: otherRestautantLocation)
    return deliveryDistance < restautantRange || secondDeliveryDistance < restautantRange
}

isInDeliveryRange(location: (x: 5, y: 5))

// MARK: first structure
// x&y: property
struct Location {
    let x: Int
    let y: Int
}

let storeLocation = Location(x: 3, y: 4)

struct DeliveryArea {
    let center: Location
    let radius: Double
}

var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

// MARK: Accessing members
print(storeArea.radius) // 2.5
print(storeArea.center.x) // 3
storeArea.radius = 250

let fixedArea = DeliveryArea(center: storeLocation, radius: 4)
// Error: Cannot assign to property
// Because fixedArea is a constant and can not change
fixedArea.radius = 250

// MARK: Introducing methods
let areas = [
    DeliveryArea(center: Location(x: 3, y: 4), radius: 2.5),
    DeliveryArea(center: Location(x: 7, y: 8), radius: 1.5),
]

func isInDeliveryRange(_ location: Location) -> Bool {
    for area in areas {
        let distanceToStore = distance(from: (area.center.x, area.center.y),
                                       to: (location.x, location.y))
        
        if distanceToStore < area.radius {
            return true
        }
    }
    
    return false
}

let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 5, y: 5)

print(isInDeliveryRange(customerLocation1)) // false
print(isInDeliveryRange(customerLocation2)) // true


func contains(_ location: Location) -> Bool {
    let distanceFromCenter = distance(from: (center.x, center.y),
                                      to: (location.x, location.y))
    return distanceFromCenter < radius
}

let area = DeliveryArea(center: Location(x: 4, y: 4), radius: 2.5)
let customerLocation = Location(x: 5, y: 5)
area.contains(customerLocation) // true

// MARK: Structures as values
// copy-on-assignment
var a = 5
var b = 5
print(a) // 5
print(b) // 5

a = 10
print(a) // 10
print(b) // 5

var area1 = DeliveryArea(center: Location(x: 3, y: 4), radius: 2.5)
var area2 = area1
print(area1.radius) // 2.5
print(area2.radius) // 2.5

area1.radius = 4
print(area1.radius) // 4.0
print(area2.radius) // 2.5

// MARK: Structures everywhere
@frozen public struct Int : FixedWidthInteger, SignedInteger {
 // …
}

// MARK: Conforming to a protocol
@frozen public struct Int : FixedWidthInteger, SignedInteger {
 // …
}

public protocol CustomStringConvertible {
    /// A textual representation of this instance
    var description: String { get }
}

struct DeliveryArea: CustomStringConvertible {
    let center: Location
    var radius: Double
    var description: String {
        """
        Area with center: {x: \(center.x), y: \(center.y)},
        radius: \(radius)
        """
    }
    
    func contains(_ location: Location) -> Bool {
        distance(from: center, to: location) < radius
    }
    
    func overlaps(with area: DeliveryArea) -> Bool {
        distance(from: center, to: area.center) <=
            (radius + area.radius)
    }
}

print(area1) // Area with center: (x: 3, y: 4), radius: 4.0
print(area2) // Area with center: (x: 3, y: 4), radius: 2.5
