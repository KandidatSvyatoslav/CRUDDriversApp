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
        
        cell.firstNameLabel?.text = carDriver.driver.firstName
        cell.lastNameLabel?.text = carDriver.driver.lastName
        cell.carMarkLabel?.text = carDriver.car.carMark
        cell.carModelLabel?.text = carDriver.car.carModel
        cell.carNumberLabel?.text = carDriver.car.carNumber
        
        // Configure the cell...
        
        return cell
    }
    


    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

   
}
