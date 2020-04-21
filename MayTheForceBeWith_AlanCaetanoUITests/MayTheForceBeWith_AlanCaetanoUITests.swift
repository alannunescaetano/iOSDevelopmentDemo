//
//  MayTheForceBeWith_AlanCaetanoUITests.swift
//  MayTheForceBeWith_AlanCaetanoUITests
//
//  Created by Alan Caetano on 09/04/2020.
//  Copyright © 2020 AlanAppFactory. All rights reserved.
//

import XCTest

class MayTheForceBeWith_AlanCaetanoUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {

        continueAfterFailure = false
        
        app = XCUIApplication()

    }

    override func tearDown() {
        app = nil
    }

    func testOpenPerson() {

        app.launch()
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()
        
        var labelPersonName = app.staticTexts.element(matching: .any, identifier: "labelPersonName").label
        XCTAssert(labelPersonName == "Luke Skywalker")
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        let secondCell = app.tables.cells.element(boundBy: 1)
        XCTAssertTrue(secondCell.exists)
        secondCell.tap()
        
        labelPersonName = app.staticTexts.element(matching: .any, identifier: "labelPersonName").label
        XCTAssert(labelPersonName == "Han Solo")
        
    }
    
    func testSharePerson() {

        app.launch()
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()
        
        var buttonSharePerson = app.navigationBars.buttons.element(boundBy: 1)
        XCTAssertTrue(buttonSharePerson.exists)
        
        buttonSharePerson.tap()
        
        XCTAssert(app.alerts.element.staticTexts["Person data sent successfully."].exists)
        
        
    }
}
