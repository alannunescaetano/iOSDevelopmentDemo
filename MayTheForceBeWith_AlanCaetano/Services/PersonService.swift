//
//  PersonService.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 10/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import Foundation

class PersonService {
    
    private var _dummyPersonList: Array<Person>
    
    init() {
        _dummyPersonList = Array<Person>()
        _dummyPersonList.append(Person(id: 1, name: "Luke Skywalker", species: "Human", idHomeWorld: 2, homeworld: "Tatooine", idSpaceship: 1, spaceship: "X-wing Starfighter", favorite: false, imageURL: "https://s2.glbimg.com/LttsvVoQZGHoIJsmdlXMULY336A=/e.glbimg.com/og/ed/f/original/2019/09/23/ea1e16061bdf92edb111d8808c6741a6.jpg"))
        _dummyPersonList.append(Person(id: 2, name: "Han Solo", species: "Human", idHomeWorld: 1, homeworld: "Corellia", idSpaceship: 2, spaceship: "Millennium Falcon",favorite: false, imageURL: "https://lumiere-a.akamaihd.net/v1/images/han-solo-main_a4c8ff79.jpeg?region=0%2C0%2C1920%2C1080&width=1536"))
        
        for n in 2...1000 {
            _dummyPersonList.append(Person(id: n, name: "Dummy \(n)", species: "Human", idHomeWorld: 2, homeworld: "Tatooine", idSpaceship: 1, spaceship: "X-wing Starfighter", favorite: false, imageURL: ""))
        }
    }
    
    func getPersons(startIndex:Int, numbersOfElements:Int) -> Array<Person> {
        
//        if(!searchQuery.isEmpty) {
//            filtered = filtered.filter { $0.name.contains(searchQuery) || $0.homeworld.contains(searchQuery) || $0.species.contains(searchQuery) }
//        }
        
        return Array(_dummyPersonList[startIndex..<(startIndex + numbersOfElements)])
    }
    
    func getPerson(id:Int) -> Person?{
        let filtered = _dummyPersonList.filter { $0.id == id }
        if(filtered.count > 0) {
            return filtered[0]
        } else {
            return nil
        }
    }
    
    func setPersonAsFavorite(id:Int, isFavorite: Bool){
        let filtered = _dummyPersonList.filter { $0.id == id }
        if(filtered.count > 0) {
            filtered[0].favorite = isFavorite
        }
    }
    
}
