//
//  LoadingCell.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 11/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//


import UIKit

class LoadingCell : UITableViewCell {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
