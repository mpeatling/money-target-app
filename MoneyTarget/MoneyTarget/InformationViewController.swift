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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setupDesign() {
        self.numberOfHoursWorkedTextBox.attributedPlaceholder = NSAttributedString(string: "35", attributes: [NSForegroundColorAttributeName: UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0.25)])
        self.numberOfTipsEarnedTextBox.attributedPlaceholder = NSAttributedString(string: "260", attributes: [NSForegroundColorAttributeName: UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0.25)])
        self.numberOfDaysWorkedTextBox.attributedPlaceholder = NSAttributedString(string: "5", attributes: [NSForegroundColorAttributeName: UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0.25)])

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
