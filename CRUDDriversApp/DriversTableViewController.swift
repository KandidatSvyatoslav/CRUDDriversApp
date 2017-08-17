//
//  DriversTableViewController.swift
//  CRUDDriversApp
//
//  Created by Admin on 17.08.17.
//  Copyright © 2017 Svt. All rights reserved.
//

import UIKit

class DriversTableViewController: UITableViewController {

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
    


    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // action One - edit on swipe
        var sender: DriversTableViewCell = DriversTableViewCell()
        

        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: {[carDriver](action, indexPath) in
            self.carDriver = self.getAllData.object(at: sender.tag) as! CarDriver
             self.DriversTableView.reloadData()
            let DV = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
            
            DV.getID = carDriver.driver.Id
            DV.getFName = carDriver.driver.firstName
            DV.getLName = carDriver.driver.lastName
            DV.getcarMark = carDriver.car.carMark
            DV.getcarModel = carDriver.car.carModel
            DV.getcarNumber = carDriver.car.carNumber
            
            self.navigationController?.pushViewController(DV, animated: true)
        })
        // action two - delete on swipe
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {[carDriver](action, indexPath) in
             self.DriversTableView.reloadData()
            self.carDriver = self.getAllData.object(at: sender.tag) as! CarDriver
            
            _ = FMDBDatabaseModel.getInstance().deleteRecord(recID: carDriver.driver.Id)
            self.getAllData = FMDBDatabaseModel.getInstance().getAllData()
            self.DriversTableView.reloadData()

        })
        
        editAction.backgroundColor = UIColor.blue
        deleteAction.backgroundColor = UIColor.red
        
        return [deleteAction, editAction]
    }

   
}
