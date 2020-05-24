//
//  StackViewCell.swift
//  StackViewTest
//
//  Created by Sujananth Visvaratnam on 23/05/20.
//  Copyright © 2020 Sujananth Visvaratnam. All rights reserved.
//

import UIKit

protocol StackViewCellDelegate: class {
    func didUpdated()
}

class StackViewCell: UITableViewCell {
    
    @IBOutlet weak var topStackView: SampleChildStackView!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sampleTextFields: UITextField!
    @IBOutlet weak var bottomStackView: SampleChildStackView!
    
    weak var delegate: StackViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameLabel.isHidden = true
        self.topStackView.configurePotato()
    }
    
    func configure() {
        self.bottomStackView.delegate = self
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] timer in
            self?.nameLabel.isHidden = false
            self?.nameLabel.text = "Haters gonna hate and potatoes gonna potate"
            self?.delegate?.didUpdated()
            self?.bottomStackView.configureTomato()
            timer.invalidate()
           }
    }
}

extension StackViewCell: SampleChildStackViewDelegate {
    func didUpdate() {
        self.delegate?.didUpdated()
    }
}

