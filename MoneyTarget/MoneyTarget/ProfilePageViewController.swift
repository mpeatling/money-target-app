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
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    func doneButtonTapped(textField: UIToolbarTextField) {
        
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
