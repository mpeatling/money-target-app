//
//  ViewController.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-10.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController {
    @IBOutlet weak var goalAmountTextBox: UITextField!
    @IBOutlet weak var timeframeTextBox: UITextField!
    @IBOutlet weak var startSavingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDesign()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupDesign() {
       self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.startSavingButton.layer.cornerRadius = self.startSavingButton.frame.height/2
        self.goalAmountTextBox.attributedPlaceholder = NSAttributedString(string: "$500", attributes: [NSForegroundColorAttributeName: UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0.25)])
        self.timeframeTextBox.attributedPlaceholder = NSAttributedString(string: "Feb 5, 2018", attributes: [NSForegroundColorAttributeName: UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0.25)])
        self.addDoneButtonOnKeyboard()
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
        
        self.goalAmountTextBox.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        self.goalAmountTextBox.resignFirstResponder()
    }

    @IBAction func startSavingButtonPressed(_ sender: Any) {
    }
   
}

