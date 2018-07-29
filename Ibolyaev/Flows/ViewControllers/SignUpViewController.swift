//
//  SignUpViewController.swift
//  Ibolyaev
//
//  Created by Ronin on 29/07/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var name: UITextField!
    
    @IBOutlet var email: UITextField!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var bio: UITextView!
    @IBOutlet var creditCard: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
