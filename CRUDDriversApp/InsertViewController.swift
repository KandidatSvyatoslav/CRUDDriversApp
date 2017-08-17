//
//  InsertViewController.swift
//  CRUDDriversApp
//
//  Created by Admin on 17.08.17.
//  Copyright © 2017 Svt. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var carMarkTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carNumberTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func insertBTN(_ sender: Any) {
        
        var carDriver: CarDriver = CarDriver()
        let alertController1 = UIAlertController(title: "Error", message: "Not all fields are filled out", preferredStyle: UIAlertControllerStyle.alert)
        let alertController2 = UIAlertController(title: "", message: "Insert Successfully", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController1.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        alertController2.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        if ((firstNameTextField.text != nil) || (lastNameTextField.text != nil) || (carMarkTextField.text != nil) || (carModelTextField.text != nil) || (carNumberTextField.text != nil)) {
        
        carDriver.driver.firstName = firstNameTextField.text!
        carDriver.driver.lastName = lastNameTextField.text!
        carDriver.car.carMark = carMarkTextField.text!
        carDriver.car.carModel = carModelTextField.text!
        carDriver.car.carNumber = carNumberTextField.text!

        
        let isInserted = FMDBDatabaseModel.getInstance().insertData(carDriver)
        
        if isInserted {
            print("Insert Successfully")
        } else {
            print("Insert error")
            }
        } else {
            self.present(alertController1, animated: true, completion: nil)
            return
        }
        self.present(alertController2, animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
