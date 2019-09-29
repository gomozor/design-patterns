//
//  Factory.swift
//  patterns
//
//  Created by Developer on 29.09.2019.
//  Copyright © 2019 Developer. All rights reserved.
//  -------------------------------------------------------------------------
//  Factory Pattern:
//      It creates pile of objects as a production machine (in other terms)
//      Only you should pass the necessary type of what you want it to create
//  -------------------------------------------------------------------------


import Foundation

protocol Ingredient {
   func smells()
   func tastes()
}
 
protocol Salad {
    func makeItRightNow(type:SaladType) -> [Ingredient]?
    func mixIt(choppedInBowl:[Ingredient]?)
}

enum SaladType {
   case FruitSalad
   case VegetableSalad
   case OtherType
   case None
}

class SaladMakingFactory: Salad {
    
    func makeItRightNow(type: SaladType) -> [Ingredient]? {
        switch type {
            case .FruitSalad:
                return [
                    Fruit(name: "Banana"),
                    Fruit(name: "Strawberry"),
                    Fruit(name: "Kiwi"),
                    AnySubstance(name: "Chocolate Sauce"),
                    AnySubstance(name: "M&Ms")
                ]
            case .VegetableSalad:
                return [
                    Vegetable(name: "Tomato"),
                    Vegetable(name: "Sweet Pepper"),
                    AnySubstance(name: "Salt"),
                    AnySubstance(name: "Dib Roman"),
                    AnySubstance(name: "Sunflower Seed Oil")
                ]
            case .OtherType:
                return nil
            case .None:
                return nil
        }
    }
    
    func mixIt(choppedInBowl: [Ingredient]?) {
        if let choppedInBowl = choppedInBowl {
            for i in choppedInBowl {
                i.smells()
                i.tastes()
            }
            print("\n ... \n ... \n ...  \n ...  \n ... ");
            print("\n Done!");
            print("\n Ready to enjoy! \n \n");
        }
    }
}

class Vegetable: Ingredient {
    
    var name:String
    
    init(name:String) { self.name = name }
    
    func smells() {
        print("\nAny \(self.name) has a smell")
    }
    
    func tastes() {
         print("\nAny \(self.name) has a taste");
    }
}

class Fruit: Ingredient {
    
    var name:String
    
    init(name:String) { self.name = name }
    
    func smells() {
        print("\nI dont take the smell on \(self.name) generally")
    }
    
    func tastes() {
        print("\nMost fruits tastes good, have you tried \(self.name)?");
    }
}

class AnySubstance: Ingredient {
    
    var name:String
    
    init(name:String) { self.name = name }
    
    func smells() {
        print("\n\(self.name) may or may not smell!")
    }
    
    func tastes() {
        print("\n\(self.name) doesn't have to have a taste")
    }
}

 
//  -------------------------------------------------------------------------
//  -------------------------------------------------------------------------
//                                  TEST NOW
//  -------------------------------------------------------------------------
//  -------------------------------------------------------------------------
 

print("\nFactory pattern exercise begins!!")
print("\n ... \n ... \n ...  \n ...  \n ... ")

let saladMaker = SaladMakingFactory();
saladMaker.mixIt(choppedInBowl: saladMaker.makeItRightNow(type: .VegetableSalad))
