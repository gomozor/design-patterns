//
//  AbstractFactory.swift
//
//  Created by Developer on 29.09.2019.
//  Copyright © 2019 Developer. All rights reserved.
//  -------------------------------------------------------------------------
//  AbstractFactory Pattern:
//      It works like a super factory, creator of sub-factories
//      Also, called as factory of factories
//      It's like, imlementation of the abstraction behind, the abstraction
//  -------------------------------------------------------------------------

 

import Foundation


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
    func get(type:String) -> Vehicle?
}

//Classes - Implementations
class Sedan: Vehicle {
    func getSpecs() {
        print("\nSedan(US)/Saloon(UK) is traditionally defined as a car with four doors and a typical trunk.")
    }
}

class Hatchback: Vehicle {
    func getSpecs() {
        print("\nA hatchback is a car type with a rear door that opens upwards.")
    }
}

class NakedBike: Vehicle {
    func getSpecs() {
        print("\nNaked bikes recall British motorcycles of the sixties.")
    }
}

class Chopper: Vehicle {
    func getSpecs() {
        print("\nChoppers tend to have extremely raked forks, like Harley-Davidson.")
    }
}

class CarFactory : AbstractFactory {
    func get(type: String) -> Vehicle? {
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
    func get(type: String) -> Vehicle? {
        if let bikeType = BikeType(rawValue: type) {
            switch bikeType {
                case .naked:
                    return NakedBike()
                case .chopper:
                    return Chopper()
                default:
                    return nil
            }
        }
        return nil
    }
}
 
//Final Class - sums up all the abstraction & is responsible of creation of all factories
class Producer {
    static func getAbstractFactory(factoryType:VehicleType) -> AbstractFactory {
        switch factoryType {
            case .motorcyle:
                return MotorcycleFactory()
            case .car:
                return CarFactory()
        }
    }
}


//  -------------------------------------------------------------------------
//  -------------------------------------------------------------------------
//                                  TEST NOW
//  -------------------------------------------------------------------------
//  -------------------------------------------------------------------------
  

print("\nAbstractFactory pattern exercise begins!!")
print("\n ... \n ... \n ...  \n ...  \n ... ")

//Produce bikes first
let bikeFactory = Producer.getAbstractFactory(factoryType: .motorcyle)
bikeFactory.get(type: "naked")?.getSpecs()
bikeFactory.get(type: "chopper")?.getSpecs()

//Produce cars now
let carFactory = Producer.getAbstractFactory(factoryType: .car)
carFactory.get(type: "sedan")?.getSpecs()
carFactory.get(type: "hatchback")?.getSpecs()
 
print("\n ... \n ... \n ...  \n ...  \n ... ")
print("\nDone!")
print("\nReady to enjoy!\n")
