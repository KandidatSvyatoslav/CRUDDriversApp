//
//  DriversTableViewController.swift
//  CRUDDriversApp
//
//  Created by Admin on 17.08.17.
//  Copyright © 2017 Svt. All rights reserved.
//

import UIKit

class DriversTableViewController: UITableViewController, buttonDeleget {

    @IBOutlet var DriversTableView: UITableView!
    
    var carDriver = CarDriver()
    var getAllData = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllData = FMDBDatabaseModel.getInstance().getAllData()
        DriversTableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        getAllData = FMDBDatabaseModel.getInstance().getAllData()
        DriversTableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return getAllData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DriversTableViewCell
       cell.editData = self as? buttonDeleget
        cell.tag = indexPath.row
        
        carDriver = getAllData.object(at: indexPath.row) as! CarDriver
        cell.firstNameLabel.text = carDriver.driver.firstName
        cell.lastNameLabel.text = carDriver.driver.lastName
        cell.carMarkLabel.text = carDriver.car.carMark
        cell.carModelLabel.text = carDriver.car.carModel
        cell.carNumberLabel.text = carDriver.car.carNumber
        
        // Configure the cell...
        
        return cell
    }
    func EditButton(sender: DriversTableViewCell) {
        
        print("editClicked")
        
        let DV = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        
        
        carDriver = getAllData.object(at: sender.tag) as! CarDriver
        DV.getID = carDriver.driver.Id
        DV.getFName = carDriver.driver.firstName
        DV.getLName = carDriver.driver.lastName
        DV.getcarMark = carDriver.car.carMark
        DV.getcarModel = carDriver.car.carModel
        DV.getcarNumber = carDriver.car.carNumber
        
        self.navigationController?.pushViewController(DV, animated: true)
        
    }
    
    func DeleteButton(sender: DriversTableViewCell) {
        print("deleteClicked")
        carDriver = getAllData.object(at: sender.tag) as! CarDriver
        
        _ = FMDBDatabaseModel.getInstance().deleteRecord(recID: carDriver.driver.Id)
        getAllData = FMDBDatabaseModel.getInstance().getAllData()
        DriversTableView.reloadData()
        
    }
    
    



   
}
