//
//  WorkDay.swift
//  MoneyTarget
//
//  Created by Matt Peatling on 2017-09-05.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import Foundation

class Tip: NSObject, NSCoding {
    
    var earned = 0
    var saved = 0
    var date = Date()

    init(earned: Int, saved: Int, date: Date) {
        super.init()
        self.earned = earned
        self.saved = saved
        self.date = date
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let earned = decoder.decodeInteger(forKey: "earned")
        let saved = decoder.decodeInteger(forKey: "saved")
        var finishDate = Date()
     
        if let decodedDate = decoder.decodeObject(forKey: "finishDate") {
            finishDate = decodedDate as! Date
        }
        
        
        self.init(
            earned: earned,
            saved: saved,
            date: finishDate
        )
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.earned, forKey: "earned")
        aCoder.encode(self.saved, forKey: "saved")
        aCoder.encode(self.date, forKey: "date")
    }
}

