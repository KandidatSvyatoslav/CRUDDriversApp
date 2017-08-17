//
//  EditViewController.swift
//  CRUDDriversApp
//
//  Created by Admin on 17.08.17.
//  Copyright © 2017 Svt. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var carMarkTextField: UITextField!
    @IBOutlet weak var carModelTextField: UITextField!
    @IBOutlet weak var carNumberTextField: UITextField!
    
    
    var getID = Int()
    var getFName = ""
    var getLName = ""
    var getcarMark = ""
    var getcarModel = ""
    var getcarNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.text = getFName
        lastNameTextField.text = getLName
        carMarkTextField.text = getcarMark
        carModelTextField.text = getcarModel
        carNumberTextField .text = getcarNumber
        idLabel.text = String(getID)
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPressed(_ sender: Any) {
        _ = FMDBDatabaseModel.getInstance().updateRecord(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, carMark: carMarkTextField.text!, carModel: carModelTextField.text!, carNumber: carNumberTextField.text!, recID: getID)
        print("update")
        
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
