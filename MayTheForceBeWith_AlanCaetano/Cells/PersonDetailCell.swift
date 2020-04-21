//
//  PersonDetailCell.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 10/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import UIKit

class PersonDetailCell : UITableViewCell {
    
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var valueText: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
