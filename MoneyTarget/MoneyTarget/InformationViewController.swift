//
//  InformationViewController.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-10.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet weak var numberOfHoursWorkedTextBox: UIToolbarTextField!
    @IBOutlet weak var numberOfTipsEarnedTextBox: UIToolbarTextField!
    @IBOutlet weak var numberOfDaysWorkedTextBox: UIToolbarTextField!
    @IBOutlet weak var informationOnAmountsToEnterLabel: UILabel!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var containerView: UIView!
    
    var keyboardIsShowing = false
    let containerViewOffset: CGFloat = -100
    var containerViewYOrigin: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDesign()
        self.nextButton.isEnabled = false
        
        self.view.setNeedsLayout()
        self.containerViewYOrigin = self.containerView.frame.origin.y
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
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
        self.numberOfTipsEarnedTextBox.setPlaceholder(placeholder: "260")
        self.numberOfDaysWorkedTextBox.setPlaceholder(placeholder: "5")
        self.hideTextRevealnextButton()
        
    }
    
    func keyboardWillShow() {
        self.containerView.frame.origin.y = self.containerViewOffset
        self.keyboardIsShowing = true
    }
    
    func keyboardWillHide() {
        self.containerView.frame.origin.y = self.containerViewYOrigin
        self.keyboardIsShowing = false
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
        if numberOfHoursWorkedTextBox.text == "" || numberOfTipsEarnedTextBox.text == "" || numberOfDaysWorkedTextBox.text == "" {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
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
