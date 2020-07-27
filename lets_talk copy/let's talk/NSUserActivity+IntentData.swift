//
//  NSUserActivity+IntentData.swift
//  IntentKit
//
//  Created by Shivani Kannan on 02/06/20.
//  Copyright © 2020 Shivani Kannan. All rights reserved.
//

import Foundation
import Intents


extension NSUserActivity {
    
    public static let letsTalkActivityType = "com.shivanikannan.intentkit.letstalk"
    
    public static var letsTalkActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: NSUserActivity.letsTalkActivityType)
        
        userActivity.title = "Lets Talk"
        userActivity.persistentIdentifier = NSUserActivityPersistentIdentifier(NSUserActivity.letsTalkActivityType)
        userActivity.isEligibleForPrediction = true
        userActivity.suggestedInvocationPhrase = "Lets talk"
        
        return userActivity
    }
}
