//
//  InformationViewController.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-10.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet weak var numberOfHoursWorkedTextBox: UITextField!
    @IBOutlet weak var numberOfTipsEarnedTextBox: UITextField!
    @IBOutlet weak var numberOfDaysWorkedTextBox: UITextField!
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var informationOnAmountsToEnterLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDesign()
        // Do any additional setup after loading the view.
    }

    func setupDesign() {
        self.letsGoButton.layer.cornerRadius = self.letsGoButton.frame.height/2
        self.numberOfHoursWorkedTextBox.attributedPlaceholder = NSAttributedString(string: "35", attributes: [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)])
        self.numberOfTipsEarnedTextBox.attributedPlaceholder = NSAttributedString(string: "260", attributes: [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)])
        self.numberOfDaysWorkedTextBox.attributedPlaceholder = NSAttributedString(string: "5", attributes: [NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25)])
        self.hideTextRevealLetsGoButton()
        
    }
    
    func hideTextRevealLetsGoButton() {
        if numberOfHoursWorkedTextBox.text == "" || numberOfTipsEarnedTextBox.text == "" || numberOfDaysWorkedTextBox.text == "" {
            self.letsGoButton.isHidden = true
        } else {
            self.letsGoButton.isHidden = false
            self.informationOnAmountsToEnterLabel.isHidden = true
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
