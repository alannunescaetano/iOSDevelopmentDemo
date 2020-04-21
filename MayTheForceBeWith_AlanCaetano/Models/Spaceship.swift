//
//  Spaceship.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 11/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import Foundation

class Spaceship {
    var id: Int
    var name: String
    var text: String
    var imageUrl: String
    
    
    init(id:Int, name:String, text:String, imageUrl: String) {
        self.id = id
        self.name = name
        self.text = text
        self.imageUrl = imageUrl
    }
}
