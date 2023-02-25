//
//  FormattedTextField.swift
//  lovecook
//
//  Created by Laura Zafra Prat on 25/2/23.
//

import UIKit

class FormattedTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        defaultSetUp()
    }
    
    func defaultSetUp() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 5
    }

}
