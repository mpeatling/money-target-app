//
//  ProfilePageViewController.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-16.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController, UIToolbarTextFieldDelegate, UITextFieldDelegate {

    @IBOutlet weak var goalAmountLabel: UILabel!
    @IBOutlet weak var dollarAmountNeededPerShiftLabel: UILabel!
    @IBOutlet weak var tipsEarnedTodayTextField: UIToolbarTextField!
    @IBOutlet weak var hoursWorkedTodayTextField: UIToolbarTextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.enableAndDisableSaveButton()
        
        // Do any additional setup after loading the view.
    }

    func doneButtonTapped(textField: UIToolbarTextField) {
        self.enableAndDisableSaveButton()
        
    }
    
    func enableAndDisableSaveButton() {
        if self.tipsEarnedTodayTextField.text == "" || self.hoursWorkedTodayTextField.text == "" {
            self.saveButton.isEnabled = false
        } else {
            self.saveButton.isEnabled = true
        }
    }
    
    @IBAction func tipsEarnedTodayTextFieldEditingEnded(_ sender: Any) {
        self.enableAndDisableSaveButton()
    }
    
    @IBAction func hoursWorkedTodayTextFieldEditingEnded(_ sender: Any) {
        self.enableAndDisableSaveButton()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
