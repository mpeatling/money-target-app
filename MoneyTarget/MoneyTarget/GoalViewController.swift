//
//  ViewController.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-10.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController, UITextFieldDelegate, UIToolbarTextFieldDelegate {
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var goalAmountTextBox: UIToolbarTextField!
    @IBOutlet weak var timeframeTextBox: UIToolbarTextField!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    @IBOutlet weak var containerView: UIView!
    var datePicker = UIDatePicker()
    var selectedDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDesign()
        self.enableOrDisableStartSavingButton()
        self.goalAmountTextBox.customDelegate = self
        self.timeframeTextBox.customDelegate = self
    }
   
    override func viewDidAppear(_ animated: Bool) {
        self.goalAmountTextBox.becomeFirstResponder()
        print("user",appDelegate.uid)
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
        self.datePicker.minimumDate = Date()
        self.datePicker.date = self.selectedDate
        
    }
    
    func doneButtonTapped(textField: UIToolbarTextField) {
        if textField == self.timeframeTextBox {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            self.timeframeTextBox.text = dateFormatter.string(from: self.datePicker.date)
            self.selectedDate = self.datePicker.date
            self.datePicker.isHidden = false
            self.enableOrDisableStartSavingButton()
        }
    }
    
    @IBAction func timeframeTextBoxEditingBegan(_ sender: Any) {
        self.setupDatePicker()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let goalAmount = self.goalAmountTextBox.text, let goalAmountDouble = Double(goalAmount) {
            UserDefaults().set(goalAmountDouble, forKey: "com.mattpeatling.moneytarget.goalAmount")
        }
        UserDefaults().set(self.selectedDate, forKey: "com.mattpeatling.moneytarget.finishDate")
    }

}

