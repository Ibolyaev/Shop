//
//  IbolyaevUITests.swift
//  IbolyaevUITests
//
//  Created by Ronin on 06/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import XCTest

class IbolyaevUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSignUp() {
        app.buttons["Sign Up."].tap()
        
        let nameTextField = app.textFields["Name"]
        nameTextField.tap()
        nameTextField.typeText("1")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("1")
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText("1")
        
        let creditCardTextField = app.textFields["Credit card"]
        creditCardTextField.tap()
        creditCardTextField.typeText("1")
        app.buttons["SIGN UP"].tap()
        
    }
    
    func testPayment() {
        let app = XCUIApplication()
        XCUIApplication().buttons["SIGN IN"].tap()
        
        app.tables.staticTexts["Мышка"].tap()
        app.navigationBars["Product info"].buttons["Cart"].tap()
        
        app.buttons["Pay >>"].tap()
        app.buttons["Pay"].tap()
        
    }
    
}
