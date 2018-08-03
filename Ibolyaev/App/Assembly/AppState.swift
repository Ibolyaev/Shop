//
//  AppState.swift
//  Ibolyaev
//
//  Created by Ronin on 05/08/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import Foundation

class AppState {
    
    var user: User?
    
    static let shared: AppState = {
        return AppState()
    }()
    
    private init() {
    }
}
