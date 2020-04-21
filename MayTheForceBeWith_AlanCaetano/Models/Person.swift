//
//  Person.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 10/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import Foundation

class Person : Encodable {
    var id: Int
    var name: String
    var species: String
    var idHomeWorld: Int
    var homeworld: String
    var idSpaceship:Int
    var spaceship: String
    var favorite: Bool
    var imageURL: String
    
    init(id:Int, name:String, species:String, idHomeWorld: Int, homeworld:String, idSpaceship:Int, spaceship:String, favorite:Bool, imageURL: String) {
        self.id = id
        self.name = name
        self.species = species
        self.idHomeWorld = idHomeWorld
        self.homeworld = homeworld
        self.idSpaceship = idSpaceship
        self.spaceship = spaceship
        self.favorite = favorite
        self.imageURL = imageURL
    }
}
