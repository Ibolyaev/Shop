//
//  AuthRequestFactoryTest.swift
//  IbolyaevTests
//
//  Created by Ronin on 14/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Ibolyaev

class AuthRequestFactoryTest: XCTestCase {
    
    var factory: AuthRequestFactory!
    let testUser = User(id: 1, login: "Test",
                        name: "Test",
                        lastname: "Test",
                        email: nil,
                        gender: nil,
                        creditCard: nil,
                        bio: nil,
                        password: nil
    )
    override func setUp() {
        super.setUp()
        let factoryMock = RequestFactoryMock()
        factory = factoryMock.makeAuthRequestFatory()
    }
    
    override func tearDown() {
        factory = nil
        super.tearDown()
    }
    
    func testLogin() {
        let exp = expectation(description: "")
        var loginResult: LoginResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.login)
        factory.login(userName: "Test", password: "Test") { response in
            exp.fulfill()
            loginResult = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(loginResult)
    }
    func testLogout() {
        let exp = expectation(description: "")
        var logoutResult: LogoutResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.logout)
        factory.logout(user: testUser) { response in
            exp.fulfill()
            logoutResult = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(logoutResult)
    }
    
    func testSignUp() {
        let exp = expectation(description: "")
        var signUpResult: SignUpResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.registerUser)
        factory.signUp(user: testUser) { response in
            exp.fulfill()
            signUpResult = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(signUpResult)
    }
    
}
