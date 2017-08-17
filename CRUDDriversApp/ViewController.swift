//
//  ViewController.swift
//  CRUDDriversApp
//
//  Created by Admin on 17.08.17.
//  Copyright © 2017 Svt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnInsertTapped(_ sender: Any) {
        
        let DV = storyboard?.instantiateViewController(withIdentifier: "InsertViewController")
        self.navigationController?.pushViewController(DV!, animated: true)
    }


}

