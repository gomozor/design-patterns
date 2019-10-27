//
//  Observer.swift
//  patterns
//
//  Created by Developer on 27.10.2019.
//  Copyright © 2019 Developer. All rights reserved.
//  ----------------------------------------------------------------------------------------
//  Observer Pattern:
//      Observer pattern is used when there is one-to-many relationship between objects
//      if one object is modified, its depenedent objects are to be notified automatically.
//  ----------------------------------------------------------------------------------------
  

import Foundation




protocol Observer {
    var name:String { get }
    func subscribe() -> Observer
    func exit()
    func didValueChanged(_ value:Data?)
}

protocol Observable {
    func addObserver(_ o:Observer)
    func removeObserver(_ o:Observer)
    func notifyObservers(_ info:Data?)
}

class SchoolAdministrator : Observable {
     
    static let shared = SchoolAdministrator()
    var students:[Observer] = []
    
    init() { }
    
    deinit {
        students.removeAll()
    }
    
    func addObserver(_ o: Observer) {
        students.append(o)
    }
    
    func removeObserver(_ o: Observer) {
        students.removeAll { (observer) -> Bool in return o.name == observer.name }
    }
    
    func notifyObservers(_ info:Data?) { //informStudents all students that are waiting any announcements from school board...
        for s in self.students {
            s.didValueChanged(info)
        }
    }
    
    func newAnnouncementOccurs(_ announcement:String) {
        notifyObservers(Data(announcement.utf8))
    }
    
}

class Student : Observer {
    
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
    func subscribe() -> Observer {
        SchoolAdministrator.shared.addObserver(self)
        return self
    }
    
    func exit() {
        SchoolAdministrator.shared.removeObserver(self)
    }
    
    func didValueChanged(_ value: Data?) {
        if let info = value {
            reactToTheChange(String(data: info, encoding: .utf8)!)
        }
    }
    
    func reactToTheChange(_ value:String) {
        print("\nStudent #\(name): confirmed!...")
        print("Confirmation: \(value)")
        print("Response: Alright!")
    }
    
}

print("\nObserver pattern exercise begins!!")
print("\n ... \n ... \n ... \n ")
  
var student_one = Student(name: "1").subscribe()
var student_two = Student(name: "2").subscribe()
var student_three = Student(name: "3").subscribe()

print("\n!!! NEW ANNOUNCEMENT !!!")
SchoolAdministrator.shared.newAnnouncementOccurs("Do not forget your tuition fees! \nOtherwise, you will not be registering any courses!")

print("\n ... \n ... \n ...  \n ...  \n ... ")
print("\nDone!")
print("\nReady to enjoy!")

