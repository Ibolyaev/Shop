//
//  UIVerticalStepper.swift
//  IBO_UIVerticalStepper
//
//  Created by Ronin on 07/08/2018.
//  Copyright © 2018 Ronin. All rights reserved.
//

import UIKit
@IBDesignable
class UIVerticalStepper: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    
    @IBInspectable var value: Int = 0 {
        didSet {
            valueLabel.text = value.description
            delegate?.valueDidChange(value: value)
        }
    }
    
    weak var delegate: UIVerticalStepperDelegate?
    
    @IBInspectable var step: Int = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    @IBAction func plusButtonTouchUpInside(_ sender: UIButton) {
        value += step
    }
    
    @IBAction func minusButtonTouchUpInside(_ sender: UIButton) {
        value -= step
    }
    
    private func setup() {
        Bundle(for: UIVerticalStepper.self).loadNibNamed("UIVerticalStepper", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}

protocol UIVerticalStepperDelegate: class {
    func valueDidChange(value: Int)
}
