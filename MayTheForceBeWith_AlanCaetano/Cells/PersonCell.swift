//
//  PersonCell.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 10/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import UIKit

class PersonCell : UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
