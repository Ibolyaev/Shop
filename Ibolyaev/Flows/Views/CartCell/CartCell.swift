//
//  CartCell.swift
//  Ibolyaev
//
//  Created by Ronin on 05/08/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var sum: UILabel!
    @IBOutlet var qtyStepper: UIVerticalStepper!
    
    weak var delegate: CartCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set background color
        let view = UIView()
        view.backgroundColor = Colors.tint
        selectedBackgroundView = view
    }
    
    func configure(name: String, qty: Int, sum: Int) {
        self.nameLabel.text = name
        qtyStepper.value = qty
        qtyStepper.delegate = self
        self.sum.text = sum.description
    }
}

protocol CartCellDelegate: class {
    func qtyDidChange(cell: CartCell, qty: Int)
}

extension CartCell: UIVerticalStepperDelegate {
    func valueDidChange(value: Int) {
        delegate?.qtyDidChange(cell: self, qty: value)
    }
}
