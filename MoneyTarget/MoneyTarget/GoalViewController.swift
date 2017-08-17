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
        self.enableOrDisableStartSavingButton()
    
    }
    override func viewDidLayoutSubviews() {
        self.addBottomLineToGoalTextBox()
    }
    func setupDesign() {
       self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.startSavingButton.layer.cornerRadius = self.startSavingButton.frame.height/2
        self.goalAmountTextBox.attributedPlaceholder = NSAttributedString(string: "$500", attributes: [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)])
        self.timeframeTextBox.attributedPlaceholder = NSAttributedString(string: "Feb 5, 2018", attributes: [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)])
        self.addDoneButtonOnKeyboard()
        self.setupDatePicker()
        self.enableOrDisableStartSavingButton()
        
    }
    
    func addBottomLineToGoalTextBox() {
        let borderView = UIView()
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.white.cgColor
        borderView.frame = CGRect(x: -1, y:self.goalAmountTextBox.frame.height - 1, width: self.goalAmountTextBox.frame.width + 2, height: 1)
        self.goalAmountTextBox.addSubview(borderView)
        self.goalAmountTextBox.sendSubview(toBack: borderView)
        
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
        self.enableOrDisableStartSavingButton()
        
    }

    func enableOrDisableStartSavingButton() {
       if self.goalAmountTextBox.text == "" || self.timeframeTextBox.text == "" {
            self.startSavingButton.isEnabled = false
        } else {
            self.startSavingButton.isEnabled = true
        }
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
        self.datePicker.isHidden = true
        self.enableOrDisableStartSavingButton()
        
        
    }
    
    
    
    @IBAction func startSavingButtonPressed(_ sender: Any) {
    }
   
}

