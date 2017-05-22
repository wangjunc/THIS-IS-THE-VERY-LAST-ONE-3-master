//
//  Reviews.swift
//  demo1
//
//  Created by BETTY KWOK on 18/05/2017.
//  Copyright © 2017 JUNCHENG WANG. All rights reserved.
//

import Foundation
import UIKit

class Reviews {
    
    var userDate : Date
    var userName : String
    var userFeedback : String
    var userButton : UIButton
    var userLabel : UILabel

    
    init(date : Date, name : String, feedback : String,  button : UIButton, label : UILabel) {
    
        
        self.userName = name
        self.userFeedback = feedback
        self.userDate = date
        self.userButton = button
        self.userLabel = label
    }
    
}

class Utilities {
    
    static var dateFormatter = DateFormatter()
    static var reviews : [Reviews] = []
    static func loadReviews(){
        dateFormatter.dateFormat = "yy/mm/dd"
        reviews = [ 
        
        ]
        
    }
    
}
