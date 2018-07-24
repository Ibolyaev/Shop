//
//  LoginViewController.swift
//  Ibolyaev
//
//  Created by Ronin on 28/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var authRequest: AuthRequestFactory!
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authRequest = RequestFactory().makeAuthRequestFatory()
    }

    @IBAction func loginTouchUpInside(_ sender: UIButton) {
        guard let name = loginTextField.text, let password = passwordTextField.text else {
            return
        }
        authRequest.login(userName: name, password: password) {[weak self] (result) in
            if let user = result.value?.user {
                self?.performSegue(withIdentifier: SegueIdentifiers.userInformation, sender: user)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.userInformation,
            let userVC = segue.destination as? UserViewController,
            let user = sender as? User {
            userVC.user = user
        }
    }
}
