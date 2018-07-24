//
//  UserViewController.swift
//  Ibolyaev
//
//  Created by Ronin on 28/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel?.text = user?.name
    }
    @IBOutlet var userNameLabel: UILabel!
    
}
