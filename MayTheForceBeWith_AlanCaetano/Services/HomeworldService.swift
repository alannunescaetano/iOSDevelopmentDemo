//
//  Homeworld.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 11/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import Foundation

class HomeworldService {
    
    private var _dummyHomeworldList: Array<Homeworld>
    
    init() {
        _dummyHomeworldList = Array<Homeworld>()
        _dummyHomeworldList.append(Homeworld(id: 1, name: "Corellia", text: "An ancient world in the galactic Core, Corellia is known for its people’s wanderlust and its massive shipyards. Corellia played a key role in the expansion of galactic civilization, but that was thousands of years ago. It’s now a faded industrial planet exploited by the Empire to build TIE fighters and Star Destroyers. Corellians not born with money or influence hope to escape their homeworld in search of a better life.", imageUrl: "https://lumiere-a.akamaihd.net/v1/images/corellia-main_b70b23a7.jpeg?region=7%2C0%2C1266%2C712"))
        _dummyHomeworldList.append(Homeworld(id: 2, name: "Tatooine", text: "A harsh desert world orbiting twin suns in the galaxy’s Outer Rim, Tatooine is a lawless place ruled by Hutt gangsters. Many settlers scratch out a living on moisture farms, while spaceport cities such as Mos Eisley and Mos Espa serve as home base for smugglers, criminals, and other rogues. Tatooine’s many dangers include sandstorms, bands of savage Tusken Raiders, and carnivorous krayt dragons. The planet is also known for its dangerous Podraces, rampant gambling, and legalized slavery. Anakin Skywalker and Luke Skywalker both grew up on Tatooine, and Obi-Wan Kenobi spent years in hiding on this desolate world.", imageUrl: "https://lumiere-a.akamaihd.net/v1/images/tatooine-main_127c43c7.jpeg?region=164%2C0%2C953%2C536"))
        
    }
    
    func getAllHomeworlds() -> Array<Homeworld> {
        return _dummyHomeworldList
    }
    
    func getHomeworld(id:Int) -> Homeworld?{
        let filtered = _dummyHomeworldList.filter { $0.id == id }
        if(filtered.count > 0) {
            return filtered[0]
        }else{
            return nil
        }
    }
    
}
