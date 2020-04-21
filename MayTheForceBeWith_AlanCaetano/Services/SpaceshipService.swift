//
//  SpaceshipService.swift
//  MayTheForceBeWith_AlanCaetano
//
//  Created by Alan Caetano on 11/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import Foundation

class SpaceshipService {
    
    private var _dummySpaceshipList: Array<Spaceship>
    
    init() {
        _dummySpaceshipList = Array<Spaceship>()
        _dummySpaceshipList.append(Spaceship(id: 1, name: "X-wing Starfighter", text: "The X-wing is a versatile Rebel Alliance starfighter that balances speed with firepower. Armed with four laser cannons and two proton torpedo launchers, the X-wing can take on anything the Empire throws at it. Nimble engines give the X-wing an edge during dogfights, and it can make long-range jumps with its hyperdrive and its astromech droid co-pilot. Luke Skywalker is famous for destroying the Death Star behind the controls of an X-wing.", imageUrl: "https://lumiere-a.akamaihd.net/v1/images/X-Wing-Fighter_47c7c342.jpeg?region=0%2C1%2C1536%2C864"))
        _dummySpaceshipList.append(Spaceship(id: 2, name: "Millennium Falcon", text: "An extensively modified Corellian light freighter, the Millennium Falcon is a legend in smuggler circles and is coveted by many for being the fastest hunk of junk in the galaxy. Despite her humble origins and shabby exterior, the ship that made the Kessel Run in less than 12 parsecs has played a role in some of the greatest victories of the Rebel Alliance and the New Republic. The Falcon looks like a worn-out junker, but beneath her hull she’s full of surprises. ", imageUrl: "https://lumiere-a.akamaihd.net/v1/images/millennium-falcon-1-retina_00b73517.jpeg?region=0%2C0%2C1200%2C507"))
        
    }
    
    func getAllSpaceships() -> Array<Spaceship> {
        return _dummySpaceshipList
    }
    
    func getSpaceship(id:Int) -> Spaceship?{
        let filtered = _dummySpaceshipList.filter { $0.id == id }
        if(filtered.count > 0) {
            return filtered[0]
        }else{
            return nil
        }
    }
    
}
