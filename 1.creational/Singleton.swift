//
//  Singleton.swift
//  patterns
//
//  Created by Developer on 27.10.2019.
//  Copyright © 2019 Developer. All rights reserved.
//  ------------------------------------------------------------------------------
//  Singleton Pattern:
//      It is the simplest pattern among the others.
//      Create one globally accessible instance of the class and use it everywhere
//  ------------------------------------------------------------------------------


import Foundation

class DataRepository {
    
    static let shared = DataRepository()
    
    init() {}
    
    private func save(data: Data?) {
        if let _ = data {
            print("Data is persisted...")
        }
    }
    
    private func retrieve() -> Data? {
        print("Data has been fetched!")
        return Data()
    }
    
}




print("\Singleton pattern exercise begins!!")
print("\n ... \n ... \n ... \n ")
 
DataRepository.shared.save(Data("hi".utf8))
DataRepository.shared.retrieve()

print("\n ... \n ... \n ...  \n ...  \n ... ")
print("\nDone!")
print("\nReady to enjoy!")

