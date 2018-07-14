//
//  AppDelegate.swift
//  Ibolyaev
//
//  Created by Ronin on 06/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
   let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        /*
        // Auth
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        // Signup
        var newUser = User(id: 111, login: "Ivan", name: "Ivan", lastname: "B", email: nil, gender: nil, creditCard: nil, bio: nil, password: "123")
        auth.signUp(user: newUser) { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        // Logout
        auth.logout(user: newUser) { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        // Change user data
        newUser.bio = "Tratata"
        let userDataRequest = requestFactory.makeUserDataRequestFatory()
        userDataRequest.update(user: newUser) { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
 */
        // Get product list
        let productsRequest = requestFactory.makeProductsRequestFactory()
        productsRequest.getList(category: 1, page: 1) { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        productsRequest.getWith(id: 1) {
            response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        return true
    }
}

