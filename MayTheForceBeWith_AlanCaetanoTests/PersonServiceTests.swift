//
//  PersonServiceTests.swift
//  MayTheForceBeWith_AlanCaetanoTests
//
//  Created by Alan Caetano on 12/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import XCTest
@testable import MayTheForceBeWith_AlanCaetano

class PersonServiceTests: XCTestCase {

    var service:PersonService?
    
    override func setUp() {
        service = PersonService()
    }

    override func tearDown() {
        service = nil
    }

    func testGetPersonsWithNElements() {
//        I'll use a for statement here to test if the method works with every N value
        for n in 1...20 {
            do {
                let personsRetrieved = try service!.getPersons(startIndex: 0, numbersOfElements: n) //try make no sense here, but it'd make if it was a real service
                
                if personsRetrieved.count != n {
                   XCTFail("TEST FAILED: Wrong number of person retrieved.")
                }
                
            } catch  {
                XCTFail("TEST FAILED: The test throw an exception.")
            }
        }
        
        XCTAssert(true, "TEST SUCCESSFUL")
    }
    
    func testGetPerson() {
        do {
            var personRetrieved = try service!.getPerson(id: 1)! //try make no sense here, but it'd make if it was a real service
            
            XCTAssertEqual(personRetrieved.id, 1)
            XCTAssertEqual(personRetrieved.name, "Luke Skywalker")
            XCTAssertEqual(personRetrieved.idSpaceship, 1)
            XCTAssertEqual(personRetrieved.spaceship, "X-wing Starfighter")
            XCTAssertEqual(personRetrieved.idHomeWorld, 2)
            XCTAssertEqual(personRetrieved.homeworld, "Tatooine")
            XCTAssertEqual(personRetrieved.species, "Human")
            XCTAssertEqual(personRetrieved.favorite, false)
            
            personRetrieved = try service!.getPerson(id: 2)!
            
            XCTAssertEqual(personRetrieved.id, 2)
            XCTAssertEqual(personRetrieved.name, "Han Solo")
            XCTAssertEqual(personRetrieved.idSpaceship, 2)
            XCTAssertEqual(personRetrieved.spaceship, "Millennium Falcon")
            XCTAssertEqual(personRetrieved.idHomeWorld, 1)
            XCTAssertEqual(personRetrieved.homeworld, "Corellia")
            XCTAssertEqual(personRetrieved.species, "Human")
            XCTAssertEqual(personRetrieved.favorite, false)
            
            
        } catch  {
            XCTFail("TEST FAILED: The test throw an exception.")
        }
    }
    
    func testSetPersonAsFavorite() {
        do {
            var personRetrieved = try service!.getPerson(id: 1)! //try make no sense here, but it'd make if it was a real service
            XCTAssertEqual(personRetrieved.id, 1)
            XCTAssertEqual(personRetrieved.favorite, false)
            
            service?.setPersonAsFavorite(id: 1, isFavorite: true)
            
            personRetrieved = try service!.getPerson(id: 1)!
            XCTAssertEqual(personRetrieved.id, 1)
            XCTAssertEqual(personRetrieved.favorite, true)

            service?.setPersonAsFavorite(id: 1, isFavorite: false)
            
            personRetrieved = try service!.getPerson(id: 1)!
            XCTAssertEqual(personRetrieved.id, 1)
            XCTAssertEqual(personRetrieved.favorite, false)
            
            
        } catch  {
            XCTFail("TEST FAILED: The test throw an exception.")
        }
    }
}
