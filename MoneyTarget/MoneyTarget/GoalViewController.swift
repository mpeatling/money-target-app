//
//  ViewController.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-10.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var goalAmountTextBox: UITextField!
    @IBOutlet weak var timeframeTextBox: UITextField!
    @IBOutlet weak var startSavingButton: UIButton!
    
    var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDesign()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupDesign() {
       self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.startSavingButton.layer.cornerRadius = self.startSavingButton.frame.height/2
        self.goalAmountTextBox.attributedPlaceholder = NSAttributedString(string: "$500", attributes: [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)])
        self.timeframeTextBox.attributedPlaceholder = NSAttributedString(string: "Feb 5, 2018", attributes: [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)])
        self.addDoneButtonOnKeyboard()
        self.setupDatePicker()
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

    func setupDatePicker() {
        // Creating DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        self.timeframeTextBox.inputView = self.datePicker
        
        // Creating ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        //toolBar.tintColor = UIColor(red: 65/255, green: 99/255, blue: 128/255, alpha: 1)
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(self.datePickerDoneClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.datePickerCancelClicked))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.timeframeTextBox.inputAccessoryView = toolBar
    }
    
    @IBAction func timeframeTextBoxEditingBegan(_ sender: Any) {
        self.setupDatePicker()
    }
    
    func datePickerCancelClicked() {
        self.timeframeTextBox.resignFirstResponder()
    }
  
    func datePickerDoneClicked() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.timeframeTextBox.text = dateFormatter.string(from: self.datePicker.date)
        self.timeframeTextBox.resignFirstResponder()
    }
    
    @IBAction func startSavingButtonPressed(_ sender: Any) {
    }
   
}

