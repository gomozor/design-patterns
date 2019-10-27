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
    
}
