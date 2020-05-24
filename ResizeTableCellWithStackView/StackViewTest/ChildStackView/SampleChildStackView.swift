//
//  SampleStackView.swift
//  StackViewTest
//
//  Created by Sujananth Visvaratnam on 24/05/20.
//  Copyright © 2020 Sujananth Visvaratnam. All rights reserved.
//

import UIKit

protocol SampleChildStackViewDelegate: class {
    func didUpdate()
}

class SampleChildStackView: UIView, NibDeclarationProtocol {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sampleTextFields: UITextField!
    weak var delegate: SampleChildStackViewDelegate?
    
    static var nibName : String {
        return String (describing: self)
    }
    
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: Self.nibName, bundle: bundle)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        _ = setUpFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        _ = setUpFromNib()
    }

    func configureTomato() {
        self.nameLabel.isHidden = true
        self.sampleTextFields.isHidden = true
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] timer in
            self?.nameLabel.isHidden = false
            self?.sampleTextFields.isHidden = false
            self?.sampleTextFields.text = "Tomato"
            self?.nameLabel.text = "Knowledge is knowing a tomato is a fruit; wisdom is not putting it in a fruit salad."
            self?.delegate?.didUpdate()
            timer.invalidate()
        }
    }
    
    func configurePotato() {
        nameLabel.text = "The roots of education are bitter, but the fruit is sweet."
        sampleTextFields.text = "FruitTheory"
    }
}


protocol NibDeclarationProtocol: AnyObject {
    static var nibName : String { get }
}

extension NibDeclarationProtocol where Self : UIView {
    static var nibName : String {
        return String (describing: self)
    }
    
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: Self.nibName, bundle: bundle)
    }
    
    func setUpFromNib() -> UIView? {
        guard let contentView = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return nil
        }
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return contentView
    }
}
