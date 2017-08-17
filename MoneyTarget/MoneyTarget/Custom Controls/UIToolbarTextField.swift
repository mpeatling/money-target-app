//
//  Extensions.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-17.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import Foundation
import UIKit

class UIToolbarTextField: UITextField {
    var customDelegate: UIToolbarTextFieldDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addDoneButtonOnKeyboard()
        self.addBottomLine()
    }
    
    func setPlaceholder(placeholder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)])
    }
    
    func addBottomLine() {
        let borderView = UIView()
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.white.cgColor
        borderView.frame = CGRect(x: -1, y:self.frame.height - 1, width: self.frame.width + 50, height: 1)
        self.addSubview(borderView)
        self.sendSubview(toBack: borderView)
        
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
        
    }
   
    func doneButtonAction() {
        self.resignFirstResponder()
        self.customDelegate?.doneButtonTapped(textField: self)
    }
}

protocol UIToolbarTextFieldDelegate: class {
    func doneButtonTapped(textField: UIToolbarTextField)
}
