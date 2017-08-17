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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDesign()
        self.nextButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    func setupDesign() {
        self.numberOfHoursWorkedTextBox.setPlaceholder(placeholder: "35")
        self.numberOfTipsEarnedTextBox.setPlaceholder(placeholder: "260")
        self.numberOfDaysWorkedTextBox.setPlaceholder(placeholder: "5")
        self.hideTextRevealLetsGoButton()
        
    }
    
    @IBAction func numberOfDaysWorkedTextBoxEditingEnded(_ sender: Any) {
          self.hideTextRevealLetsGoButton()
    }
    
    @IBAction func numberOfHoursWorkedTextBoxEditingEnded(_ sender: Any) {
          self.hideTextRevealLetsGoButton()
    }
    
    @IBAction func numberOfTipsEarnedTextBoxEditingEnded(_ sender: Any) {
          self.hideTextRevealLetsGoButton()
    }
    
    
    func hideTextRevealLetsGoButton() {
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
