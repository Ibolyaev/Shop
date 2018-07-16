//
//  UserDataRequestFactoryTest.swift
//  IbolyaevTests
//
//  Created by Ronin on 15/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Ibolyaev

class UserDataRequestFactoryTest: XCTestCase {
    let testUser = User(id: 1, login: "Test",
                        name: "Test",
                        lastname: "Test",
                        email: nil,
                        gender: nil,
                        creditCard: nil,
                        bio: nil,
                        password: nil
    )
    var factory: UserDataRequestFactory!
    override func setUp() {
        super.setUp()
        let factoryMock = RequestFactoryMock()
        factory = factoryMock.makeUserDataRequestFatory()
    }
    
    override func tearDown() {
        factory = nil
        super.tearDown()
    }
    
    func testUpdate() {
        let exp = expectation(description: "")
        var result: UserDataUpdateResult?
        OHHTTPStubsResponse.defaultStubFor(pathEnd: Api.changeUserData)
        factory.update(user: testUser) { response in
            exp.fulfill()
            result = response.value
        }
        wait(for: [exp], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    
    
}
