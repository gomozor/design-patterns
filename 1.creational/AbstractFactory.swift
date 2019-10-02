//
//  AbstractFactory.swift
//  patterns
//
//  Created by Developer on 29.09.2019.
//  Copyright © 2019 Developer. All rights reserved.
//  -------------------------------------------------------------------------
//  AbstractFactory Pattern:
//      It works like a super factory, creator of sub-factories
//      Also, called as factory of factories
//      It's like, imlementation of the abstraction behind, the abstraction
//  -------------------------------------------------------------------------


// -

import Foundation


//This protocol is responsible for creation of factories

//Enums - Types
enum VehicleType {
    case motorcyle
    case car
}

enum CarType : String {
    case none
    case sedan
    case hatchback
    case suv
    case coupe
}

enum BikeType : String {
    case none
    case dirtbike
    case naked
    case chopper
    case supersport
}
 

//Protocols - Interfaces - Abstractions
protocol Vehicle {
    func getSpecs()
}

protocol AbstractFactory {
    static func get(type:String) -> Vehicle?
}

protocol Producer {
    static func getAbstractFactory() -> AbstractFactory
}

//Classes - Implementations
class CarFactory : AbstractFactory {
    static func get(type: String) -> Vehicle? {
        if let carType = CarType(rawValue: type) {
            switch carType {
                case .sedan:
                    return Sedan()
                case .hatchback:
                    return Hatchback()
                default:
                    return nil
            }
        }
        return nil
    }
}

class MotorcycleFactory : AbstractFactory {
    static func get(type: String) -> Vehicle? {
        if let bikeType = BikeType(rawValue: type) {
            switch bikeType {
                case .sedan:
                    return Sedan()
                case .hatchback:
                    return Hatchback()
                default:
                    return nil
            }
        }
        return nil
    }
}


class Sedan: Vehicle {
    func getSpecs() {
        print("Sedan(US) or Saloon(UK) is traditionally defined as a car with four doors and a typical boot/ trunk.")
    }
}

class Hatchback: Vehicle {
    func getSpecs() {
        print("A hatchback is a car type with a rear door that opens upwards.")
    }
}

class NakedBike: Vehicle {
    func getSpecs() {
        print("Naked bikes recall British motorcycles of the sixties.")
    }
}

class Choppers: Vehicle {
    func getSpecs() {
        print("Naked bikes recall British motorcycles of the sixties.")
    }
}

