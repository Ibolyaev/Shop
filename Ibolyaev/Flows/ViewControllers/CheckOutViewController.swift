//
//  CheckOutViewController.swift
//  Ibolyaev
//
//  Created by Ronin on 05/08/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var sumLabel: UILabel!
    
    // MARK: - Public properties
    
    var sum: Int?
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - IBAction
    
    @IBAction func payTouchUpInside(_ sender: UIButton) {
    }
    
    // MARK: - Private methods
    
    private func updateUI() {
        sumLabel?.text = sum?.description
    }
}
