//
//  DriversTableViewCell.swift
//  CRUDDriversApp
//
//  Created by Admin on 17.08.17.
//  Copyright © 2017 Svt. All rights reserved.
//

import UIKit

class DriversTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var carMarkLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
