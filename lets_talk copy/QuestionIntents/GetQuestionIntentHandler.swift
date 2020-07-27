//
//  GetQuestionIntentHandler.swift
//  QuestionIntents
//
//  Created by Shivani Kannan on 23/05/20.
//  Copyright © 2020 Shivani Kannan. All rights reserved.

import Foundation
import Intents
import os.log




var model = Yesornopredict()
var model2 = Posornegpredict()
var counter_yn = 0
var counter_pn = 0


class GetQuestionIntentHandler : NSObject, GetQuestionIntentHandling {
   
    
    func resolveAnswerone(for intent: GetQuestionIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if(intent.answerone == "answerone")
        {
            completion(.needsValue())
        }
        else{
            
                 do{
                     let prediction = try model2.prediction(text: intent.answerone ?? "")
                     let result = prediction.label
                    
                     if (result == "pos" || result == "ntr")
                         {   counter_pn = 1
                             completion(.success(with: intent.answerone ?? ""))
                         }
                     else if (result == "neg")
                         {
                         counter_pn = 0
                         completion(.success(with: intent.answerone ?? ""))
                         
                         }
                         
                 }
                    
                 catch
                 {
                     //
                 }
     
        }
     
        
        
    }
    func resolveAnswerone_neg(for intent: GetQuestionIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if(intent.answerone_neg == "answerone_neg")
               {
                   if(counter_pn == 0)
                   { completion(.needsValue())}
                   else if (counter_pn == 1)
                   {   counter_pn = 0
                       completion(.success(with: intent.answerone_neg ?? ""))
                   }
                   
               }
        else
               {
                   completion(.success(with: intent.answerone_neg ?? ""))
               }
        
           
       }
    func resolveAnswertwo(for intent: GetQuestionIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if(intent.answertwo == "answertwo")
        {
            completion(.needsValue())
        }
        else {
           
            do{
                let prediction = try model.prediction(text: intent.answertwo ?? "")
                let result = prediction.label
               
                if (result == "Yes")
                    {  
                        completion(.success(with: intent.answertwo ?? ""))
                    }
                else if (result == "No")
                    {
                    counter_yn = 1
                    completion(.success(with: intent.answertwo ?? ""))
                    
                    
                    }
                    
            }
               
            catch
            {
                //
            }
                        
            
    }
        
        
    }
    
    func resolveAnswerthree(for intent: GetQuestionIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if(intent.answerthree == "answerthree")
        {
            if(counter_yn == 0)
            { completion(.needsValue())}
            else if (counter_yn == 1)
            {   counter_yn = 0
                completion(.success(with: intent.answerthree ?? ""))
            }
            
        }
        else
        {
            completion(.success(with: intent.answerthree ?? ""))
        }

    }
    
 
  
    
      public func handle(intent: GetQuestionIntent, completion: @escaping (GetQuestionIntentResponse) -> Void) {
            os_log("TK421: %{public}s", "\(#function)")
               
            completion(.success(final_response:"I'm glad we were able to talk.I hope to talk to you again later. Have a great day!" ))
              
            }
       
   
      public func confirm(intent: GetQuestionIntent, completion: @escaping (GetQuestionIntentResponse) -> Void)
      {   os_log("TK421: %{public}s", "\(#function)")
          completion(GetQuestionIntentResponse(code: .ready, userActivity: nil))
      }
    
    
 /*   func resolveAnswertwo(for intent: GetQuestionIntent, with completion: @escaping (INStringResolutionResult) -> Void)
       {
          
           if (intent.answertwo == "answertwo" ){
            
            
            
            if(hour < 15){
             completion(.needsValue())
                func predictYesorNo() {
                do{
                 let prediction = try model.prediction(text:intent.answertwo ?? "" )
                let result = prediction.label
                if (result == "yes")
                {
                    //
                        }}
                    catch {
                       //error on prediction
                    }
                
               
                
               
                }
                
                
                
           }
           else if (hour > 15){
             completion(.success(with: intent.answertwo ?? ""))
               
                      
           }
               
       }
        }
  
    
  
    */


}
