//
//  ObjectModels.swift
//  CRUDDriversApp
//
//  Created by Admin on 17.08.17.
//  Copyright © 2017 Svt. All rights reserved.
//

import Foundation

protocol Identifier {
    var Id: Int { get }
}

class Driver: NSObject, Identifier {
    var Id = Int()
    var firstName = String()
    var lastName = String()
    
}

class Car: NSObject, Identifier {
    var Id = Int()
    var carMark = String()
    var carModel = String()
    var carNumber = String()
}

class CarDriver: NSObject {
    var driver: Driver?
    var car: Car?
}
