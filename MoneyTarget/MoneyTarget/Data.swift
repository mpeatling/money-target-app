//
//  Data.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-08-29.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AppData {
    let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var settings:Settings?
   
    init() {
        self.getSettings()
    }
    
    func getSettings() {
        do {
            var request = NSFetchRequest<NSFetchRequestResult>()
            request = Settings.fetchRequest()
            request.returnsObjectsAsFaults = false
            request.predicate = NSPredicate(format: "id == 1" )
            let settingsArray = try context.fetch(request) as! [Settings]
            if settingsArray.count > 0 {
                self.settings = settingsArray[0]
            }
        } catch {
          print("Could not select settings")
        }
    }

    func saveSettings(settings: Settings) {
        if let savedSettings = self.settings {
            savedSettings.daysWorkedPerWeek = settings.daysWorkedPerWeek
            savedSettings.finishDate = settings.finishDate
            savedSettings.goalAmount = settings.goalAmount
            savedSettings.id = 1
        } else {
            self.settings = settings
        }
        
        self.appDelegate.saveContext()
        self.getSettings()
    }
    
//    func deleteSettings() {
//        for settings in self.settings {
//            self.context.delete(settings)
//        }
//
//        do {
//            try self.context.save()
//        } catch {
//            print("Could not delete settings")
//        }
//
//        print("delete")
//    }
    
}
