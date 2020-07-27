//
//  IntentHandler.swift
//  QuestionIntents
//
//  Created by Shivani Kannan on 23/05/20.
//  Copyright © 2020 Shivani Kannan. All rights reserved.
//
import Foundation
import Intents
import os.log



class IntentHandler: INExtension {
    
    
    override func handler(for intent: INIntent) -> Any {
       os_log("TK421: IntentHandler called!")
       guard intent is GetQuestionIntent else {
             fatalError("Unhandled intent")
            }
      return GetQuestionIntentHandler()
    }
    
}

