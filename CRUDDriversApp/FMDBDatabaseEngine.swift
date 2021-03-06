//
//  FMDBDatabaseEngine.swift
//  CRUDDriversApp
//
//  Created by Admin on 17.08.17.
//  Copyright © 2017 Svt. All rights reserved.
//

import Foundation

let sharedInstance = FMDBDatabaseModel()

class FMDBDatabaseModel: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> FMDBDatabaseModel {
        // singleton
        if (sharedInstance.database == nil) {
            sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "DBDrivers.sqlite"))
        }
        return sharedInstance
    }
    
    func insertData (_ carDriver: CarDriver) -> Bool {
        // sql request - insert
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO Drivers(First_Name, Last_Name, Car_Mark, Car_Model, Car_number) VALUES(?,?,?,?,?)", withArgumentsIn: [carDriver.driver.firstName, carDriver.driver.lastName, carDriver.car.carMark, carDriver.car.carModel, carDriver.car.carNumber])
        
        sharedInstance.database!.close()
        
        return( isInserted != nil)
    }
    
    func getAllData() -> NSMutableArray {
        // sql request - select select and download all data
        sharedInstance.database!.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM Drivers", withArgumentsIn: [0])
        let itemDrivers: NSMutableArray = NSMutableArray()
        
        if resultSet != nil {
            
            while resultSet.next() {
                let item: CarDriver = CarDriver()
                item.driver.Id = Int(resultSet.int(forColumn: "ID"))
                item.car.Id = Int(resultSet.int(forColumn: "ID"))
                item.driver.firstName = String(resultSet.string(forColumn: "First_Name")!)
                item.driver.lastName = String(resultSet.string(forColumn: "Last_Name")!)
                item.car.carMark = String(resultSet.string(forColumn: "Car_Mark")!)
                item.car.carModel = String(resultSet.string(forColumn: "Car_Model")!)
                item.car.carNumber = String(resultSet.string(forColumn: "Car_number")!)
                itemDrivers.add(item)
            }
        }
        
        sharedInstance.database!.close()
        return itemDrivers
    }
    func updateRecord(firstName: String, lastName: String, carMark: String, carModel: String, carNumber: String, recID: Int) -> NSMutableArray {
        // sql request - update select and download all data
        sharedInstance.database!.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("UPDATE Drivers SET First_Name = ?, Last_Name = ?, Car_Mark = ?, Car_Model = ?, Car_number = ? WHERE ID = ?", withArgumentsIn: [firstName, lastName, carMark, carModel, carNumber, recID])
        
        let itemDrivers: NSMutableArray = NSMutableArray()
        if resultSet != nil {
            
            while resultSet.next() {
                let item: CarDriver = CarDriver()
                item.driver.Id = Int(resultSet.int(forColumn: "ID"))
                item.car.Id = Int(resultSet.int(forColumn: "ID"))
                item.driver.firstName = String(resultSet.string(forColumn: "First_Name")!)
                item.driver.lastName = String(resultSet.string(forColumn: "Last_Name")!)
                item.car.carMark = String(resultSet.string(forColumn: "Car_Mark")!)
                item.car.carModel = String(resultSet.string(forColumn: "Car_Model")!)
                item.car.carNumber = String(resultSet.string(forColumn: "Car_number")!)
                itemDrivers.add(item)
            }
        }
        
        sharedInstance.database!.close()
        
        return itemDrivers
        
    }
    
    func deleteRecord(recID: Int) -> NSMutableArray {
        // sql request - delete select and download all data
        sharedInstance.database!.open()
        
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("DELETE FROM Drivers WHERE ID = ?", withArgumentsIn: [recID])
        
        let itemDrivers: NSMutableArray = NSMutableArray()
        if resultSet != nil {
            
            while resultSet.next() {
                let item: CarDriver = CarDriver()
                item.driver.Id = Int(resultSet.int(forColumn: "ID"))
                item.car.Id = Int(resultSet.int(forColumn: "ID"))
                item.driver.firstName = String(resultSet.string(forColumn: "First_Name")!)
                item.driver.lastName = String(resultSet.string(forColumn: "Last_Name")!)
                item.car.carMark = String(resultSet.string(forColumn: "Car_Mark")!)
                item.car.carModel = String(resultSet.string(forColumn: "Car_Model")!)
                item.car.carNumber = String(resultSet.string(forColumn: "Car_number")!)
                itemDrivers.add(item)
                print(item.driver.Id)
        }
        
        sharedInstance.database!.close()
       
        }
        return itemDrivers
            }
        
        
    }

