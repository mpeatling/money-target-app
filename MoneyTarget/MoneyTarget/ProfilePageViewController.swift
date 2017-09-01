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
    
    var tipsSavedToday:Double = 0.0
	//var currentDate = ""
    var totalGoalAmount:Double = 0.0
    //var finishDate = ""
    var totalTipsSavedToDate:Array<Double> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    func doneButtonTapped(textField: UIToolbarTextField) {
        
    }

    func updatedGoalAmount() {
      // This app will run everytime the app is opened || everytime the viewDidAppear
      //  var updatedGoalAmount = self.totalGoalAmount - self.totalTipsSavedToDate
    }
    
    func tipAmountNeededPerShift(goalAmount: Double, daysRemaining: Double ) {
        // This app will run everytime the app is opened || everytime the viewDidAppear
        // let tipsNeededPerShift = goalAmount / daysRemaining
        
    }
    
    func getDaysRemaining() {
//        This function will run everytime the app is opened.
//        let calendar = NSCalendar.current
//        // Replace the hour (time) of both dates with 00:00
//        let currentDate = calendar
//        let finishDate = calendar.finishDate( where the actual finishDate has been stored)
//
//        let flags = NSCalendar.Unit.day
//        let daysRemaining = calendar.components(flags, fromDate: date1, toDate: date2, options: [])
    }
    
    func getTotalTipsSavedToDate() {
//        This function will run everytime the app starts || the page is refreshed || new tips have been saved
//        let totalTips = 0.0
//        for tips in self.totalTipsSavedToDate {
//            let totalTips = totalTips + tips
//        }
    }
    
    func saveTipsSavedToday() {
//        this amount will come straight from the user input once they have picked an amount that they want to save and click the           "Save Button" this function will run
//        let todayTips = something along the lines of Double(self.dailyTipAmountTextfield.text)
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
