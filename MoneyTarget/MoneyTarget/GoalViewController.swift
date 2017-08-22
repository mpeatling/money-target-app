//
//  ViewController.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-10.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController, UITextFieldDelegate, UIToolbarTextFieldDelegate {
    @IBOutlet weak var goalAmountTextBox: UIToolbarTextField!
    @IBOutlet weak var timeframeTextBox: UIToolbarTextField!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    var datePicker = UIDatePicker()
    var minimumDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDesign()
        self.enableOrDisableStartSavingButton()
        self.goalAmountTextBox.customDelegate = self
        self.timeframeTextBox.customDelegate = self
    
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func setupDesign() {
       self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.goalAmountTextBox.setPlaceholder(placeholder: "500")
        self.timeframeTextBox.setPlaceholder(placeholder: "Feb 5, 2018")
        self.setupDatePicker()
        self.enableOrDisableStartSavingButton()
    }
    
    @IBAction func goalAmountTextBoxEditingEnded(_ sender: Any) {
        self.enableOrDisableStartSavingButton()
    }
    

    func enableOrDisableStartSavingButton() {
       if self.goalAmountTextBox.text == "" || self.timeframeTextBox.text == "" {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
    }
    
    func setupDatePicker() {
        // Creating DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        self.timeframeTextBox.inputView = self.datePicker
        if self.minimumDate > self.datePicker.date {
            self.datePicker.minimumDate = self.minimumDate
        }else{
            self.datePicker.minimumDate = self.datePicker.date
        }
        
    }
    
    func doneButtonTapped(textField: UIToolbarTextField) {
        if textField == self.timeframeTextBox {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            self.timeframeTextBox.text = dateFormatter.string(from: self.datePicker.date)
            self.minimumDate = self.datePicker.date
            self.datePicker.isHidden = true
            self.enableOrDisableStartSavingButton()
        }
    }
    
    @IBAction func timeframeTextBoxEditingBegan(_ sender: Any) {
        self.setupDatePicker()
    }
    
}

