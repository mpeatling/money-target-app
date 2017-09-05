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
    @IBOutlet weak var daysRemainingLabel: UILabel!
    
    var tipsSavedToday:Double = 0.0
    var totalGoalAmount:Double = 1000
    var finishDate = Date()
    var tips:Array<Double> = []
    var totalTipsSavedToDate:Double = 200
    var totalDaysRemaining = 0
    var tipsNeededPerShift:Double = 0
    var daysWorkedPerWeek = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        self.getUpdatedGoalAmount()
        self.getDaysRemaining()
        self.getTipAmountNeededPerShift()
    }

    func doneButtonTapped(textField: UIToolbarTextField) {
        
    }

    func getUpdatedGoalAmount() {
        print("Im next")
//        This app will run everytime the app is opened || everytime the viewDidAppear
        let updatedGoalAmount = self.totalGoalAmount - self.totalTipsSavedToDate
        self.goalAmountLabel.text = String(updatedGoalAmount)
    }
    
    func getTipAmountNeededPerShift() {
        // This app will run everytime the app is opened || everytime the viewDidAppear
        let workDaysRemaining = (self.totalDaysRemaining / 7) * self.daysWorkedPerWeek
        let rawTipsNeeded = (self.totalGoalAmount / Double(workDaysRemaining))
        self.tipsNeededPerShift = Double(round(100 * rawTipsNeeded) / 100)
        self.dollarAmountNeededPerShiftLabel.text = String(self.tipsNeededPerShift)
    }
    
    func getDaysRemaining() {
        let calendar = NSCalendar.current
        if let date1 = calendar.date(bySettingHour: 12, minute: 00, second: 00, of: calendar.startOfDay(for: Date())), let date2 = calendar.date(bySettingHour: 12, minute: 00, second: 00, of: calendar.startOfDay(for: self.finishDate)) {
            let components = calendar.dateComponents([.day], from: date1, to: date2)
            if let remainingDays = components.day {
                self.totalDaysRemaining = remainingDays
                self.daysRemainingLabel.text = String(remainingDays)
            }
        }
    }
    
    func getData() {
        let appData = AppData()
        if let settings = appData.settings {
            print(settings)
            self.finishDate = settings.finishDate as! Date
            self.daysWorkedPerWeek = settings.daysWorkedPerWeek.hashValue
            self.totalGoalAmount = settings.goalAmount
        }
        
    }

    
    func getTotalTipsSavedToDate() {
//        This function will run everytime the app starts || the page is refreshed || new tips have been saved
//        let totalTips = 0.0
//        for tips in self.totalTipsSavedToDate {
//            let totalTips = totalTips + tips
//        }
    }
    
    func saveTipsSavedToday() {
//        this amount will come straight from the user input once they have picked an amount that they want to save and click the "Save Button" this function will run
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
