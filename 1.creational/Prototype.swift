//
//  Prototype.swift
//  patterns
//
//  Created by Developer on 3.11.2019.
//  Copyright © 2019 Developer. All rights reserved.
//  ------------------------------------------------------------------------------------------------------------------------------
//  Prototype Pattern:
//       This pattern allows you to create clone of the same object rather than creating a new one.
//       When creating new one is a costly operation, application of this pattern comes in handy.
//       Suppose you have a database insert operation & after this you should return the object instance.
//       Rather than fetching again, you can return inserted object you are still keeping in the memory.
//  -------------------------------------------------------------------------------------------------------------------------------

import Foundation

protocol Human {
    func clone() -> Human
}

class Woman: Human {
    
    var name: String
    var surname: String
    var age: Int
    var outfit: String
     
    
    init(name: String, surname:String, age:Int, outfit:String) {
        self.name = name
        self.surname = surname
        self.age = age
        self.outfit = outfit
        self.created()
    }
    
    //Suppose this a costly database operation
    //You need to return the value of nearly saved object instance
    
    func created() {
        print("OUTPUT: A new woman created!")
        print("\nWoman: \n\t name:\(name)\n\t surname:\(surname)\n\t age:\(age)\n\t outfit:\(outfit)")
    }
    
    func clone() -> Human {
        return Woman(name: name, surname: surname, age: age, outfit: outfit)
    }
}



class HumanFactory {
    static func createHuman() -> Woman {
        return Woman(name: "Eva", surname: "NoSurname", age: 1, outfit: "Naked")
    }
}


print("\n Prototype pattern exercise begins!!")
print("\n ... \n ... \n ... \n ")

HumanFactory.createHuman()

print("\n ... \n ... \n ...  \n ...  \n ... ")
print("\nDone!")
print("\nReady to enjoy!")


