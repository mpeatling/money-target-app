//
//  InformationViewController.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-10.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var numberOfHoursWorkedTextBox: UIToolbarTextField!
    @IBOutlet weak var numberOfDaysWorkedTextBox: UIToolbarTextField!
    @IBOutlet weak var informationOnAmountsToEnterLabel: UILabel!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDesign()
        self.nextButton.isEnabled = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.numberOfDaysWorkedTextBox.becomeFirstResponder()
    }
    
    override func viewDidLayoutSubviews() {
        
//        if self.keyboardIsShowing {
//            self.containerView.frame.origin.y = self.containerViewOffset
//        } else {
//            self.containerView.frame.origin.y = self.containerViewYOrigin
//        }
    }

    func setupDesign() {
        self.numberOfHoursWorkedTextBox.setPlaceholder(placeholder: "35")
        self.numberOfDaysWorkedTextBox.setPlaceholder(placeholder: "5")
        self.hideTextRevealnextButton()
        
    }
    

    
    @IBAction func numberOfDaysWorkedTextBoxEditingEnded(_ sender: Any) {
          self.hideTextRevealnextButton()
    }
    
    @IBAction func numberOfHoursWorkedTextBoxEditingEnded(_ sender: Any) {
          self.hideTextRevealnextButton()
    }
    
    @IBAction func numberOfTipsEarnedTextBoxEditingDidBegin(_ sender: Any) {
        
    }
    
    
    @IBAction func numberOfTipsEarnedTextBoxEditingEnded(_ sender: Any) {
        self.hideTextRevealnextButton()
    }
    
    
    func hideTextRevealnextButton() {
        if numberOfHoursWorkedTextBox.text == ""  || numberOfDaysWorkedTextBox.text == "" {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let daysWorked = self.numberOfDaysWorkedTextBox.text, let daysWorkedInt = Int16(daysWorked) {
            UserDefaults.standard.set(daysWorkedInt, forKey: "com.mattpeatling.moneytarget.daysWorkedPerWeek")
        }
    }
}
