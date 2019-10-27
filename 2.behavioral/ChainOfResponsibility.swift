//
//  ChainOfResponsibility.swift
//  patterns
//
//  Created by Developer on 27.10.2019.
//  Copyright © 2019 Developer. All rights reserved.
//  ------------------------------------------------------------------------------------------------------------------------------
//  Chain Of Responsibility Pattern:
//      This pattern creates a pile of objects which collaboratively respond to a single request.
//      This way, request and receiver objects are decoupled.
//      Chain of responders handles the request by delegating next responder sequentially starting from the first one in the line.
//  -------------------------------------------------------------------------------------------------------------------------------
  
import Foundation

enum Type : Int {
    case server
    case cook
    case bellboy
    case dishwasher
    case cashier
}

protocol Employee {
    var next:Employee? { get set}
    func process()
    init(_ next:Employee?)
}

class Server: Employee {
    var next:Employee?
    required init(_ next:Employee?) { self.next = next }
    func process() {
         print("Server: received an order, cook?")
         next?.process()
    }
}

class Cook: Employee {
    var next:Employee?
    required init(_ next:Employee?) { self.next = next }
    func process() {
         print("Cook: meal is ready, bellboy?")
         next?.process()
    }
}

class Bellboy: Employee {
    var next:Employee?
    required init(_ next:Employee?) { self.next = next }
    func process() {
         print("Bellboy: delivered the food, customer ate it & cleared the table, dishwasher?")
         next?.process()
    }
}

class Dishwasher: Employee {
    var next:Employee?
    required init(_ next:Employee?) { self.next = next }
    func process() {
        print("Dishwasher: dishes are cleaned, ready to be used, cashier?")
        next?.process()
    }
}

class Cashier: Employee {
    var next:Employee?
    required init(_ next:Employee? = nil) { self.next = next }
    func process() {
        print("Cashier: customer paid & left with satisfaction...")
    }
}

class Restaurant {

    //Employees
    private var cashier:Cashier
    private var dishwasher:Dishwasher
    private var bellboy:Bellboy
    private var cook:Cook
    private var server:Server
    
    init() {
        cashier = Cashier()
        dishwasher = Dishwasher(cashier)
        bellboy = Bellboy(dishwasher)
        cook = Cook(bellboy)
        server = Server(cook)
    }
    
    func serveTheCustomer() {
        print("Customer received, let the service begin!!!")
        print(":::OPERATION STARTED:::")
        server.process()
        print(":::OPERATION COMPLETED:::")
    }
    
}


