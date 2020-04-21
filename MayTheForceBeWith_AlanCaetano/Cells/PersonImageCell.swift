//
//  PersonImageCell.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 10/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import UIKit

class PersonImageCell : UITableViewCell {

    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var personName: UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
