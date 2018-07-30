//
//  UserTest.swift
//  IbolyaevTests
//
//  Created by Ronin on 30/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//
@testable import Ibolyaev
import XCTest

class UserTest: XCTestCase {
    
    let correctUser = User(id: 1,
                           login: "Test",
                           name: "Test",
                           lastname: "Test",
                           email: "Test",
                           gender: "Test",
                           creditCard: "Test",
                           bio: "Test",
                           password: "Test")
    
    let inCorrectUserName = User(id: 1,
                           login: "Test",
                           name: "",
                           lastname: "Test",
                           email: "Test",
                           gender: "Test",
                           creditCard: "Test",
                           bio: "Test",
                           password: "Test")
    
    let inCorrectUserEmail = User(id: 1,
                              login: "Test",
                              name: "Test",
                              lastname: "Test",
                              email: "",
                              gender: "Test",
                              creditCard: "Test",
                              bio: "Test",
                              password: "Test")
    
    let inCorrectUserGender = User(id: 1,
                              login: "Test",
                              name: "Test",
                              lastname: "Test",
                              email: "Test",
                              gender: "",
                              creditCard: "Test",
                              bio: "Test",
                              password: "Test")
    
    let inCorrectUserCreditCard = User(id: 1,
                              login: "Test",
                              name: "Test",
                              lastname: "Test",
                              email: "Test",
                              gender: "Test",
                              creditCard: "",
                              bio: "Test",
                              password: "Test")
    
    let inCorrectUserPassword = User(id: 1,
                              login: "Test",
                              name: "Test",
                              lastname: "Test",
                              email: "Test",
                              gender: "Test",
                              creditCard: "Test",
                              bio: "Test",
                              password: "")
    
    func testCorrectUser() {
        XCTAssertTrue(correctUser.filledCorrectly())
    }
    
    func testInCorrectUserName() {
        XCTAssertFalse(inCorrectUserName.filledCorrectly())
    }
    func testInCorrectUserEmail() {
        XCTAssertFalse(inCorrectUserEmail.filledCorrectly())
    }
    func testInCorrectUserGender() {
        XCTAssertFalse(inCorrectUserGender.filledCorrectly())
    }
    func testInCorrectUserPassword() {
        XCTAssertFalse(inCorrectUserPassword.filledCorrectly())
    }
    func testInCorrectUserCreditCard() {
        XCTAssertFalse(inCorrectUserCreditCard.filledCorrectly())
    }
    
}
