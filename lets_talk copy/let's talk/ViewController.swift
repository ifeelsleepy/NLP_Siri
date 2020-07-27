//
//  ViewController.swift
//  let's talk
//
//  Created by Shivani Kannan on 22/05/20.
//  Copyright © 2020 Shivani Kannan. All rights reserved.
//

    
    import UIKit
    
    import Intents
    import os.log

    class ViewController: UIViewController {
        
        

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "You're Awesome!"
        }
        
        @IBAction func didPressLetsTalk(_ sender: Any) {
              navigateToScreen(nil)
        }
        
        func navigateToScreen(_ activity: NSUserActivity?) {
            let viewController = ShortcutViewController(activity)
            navigationController?.popToRootViewController(animated: false)
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        override func restoreUserActivityState(_ activity: NSUserActivity) {
               os_log("TK421: %{public}s", "\(#function)")
               super.restoreUserActivityState(activity)
               
               if activity.activityType == NSUserActivity.letsTalkActivityType {
                   navigateToScreen(activity)
               }
        }
        
}
        
  /*  func donateInteraction(){
   
                let intent = GetQuestionIntent()
                intent.answerone = "answerone"
                intent.answertwo = "answertwo"
                intent.answerthree = "answerthree"
                intent.answerfour = "answerfour"
                
               
                let interaction = INInteraction(intent: intent, response: nil)
                interaction.donate { (error) in
                    if error != nil {
                        if let error = error as NSError? {
                            print("Interaction donation failed: \(error.description)")
                        } else {
                            print("Successfully donated interaction")
                        }
                    }
                }
                let intent2 = GetQuestion2Intent()
                intent2.answerone = "answerone"
                intent2.answertwo = "answertwo"
                intent2.answerthree = "answerthree"
                intent2.answerfour = "answerfour"
                
               
                let interaction2 = INInteraction(intent: intent2, response: nil)
                interaction.donate { (error) in
                    if error != nil {
                        if let error = error as NSError? {
                            print("Interaction donation failed: \(error.description)")
                        } else {
                            print("Successfully donated interaction")
                        }
                    }
                }
        }
        }
    
           

    
   
    
   
   



    /*
    func donateInteraction2(){
           let intent2 = GetQuestion2Intent()
           intent2.answerone = "answerone"
           intent2.answertwo = "answertwo"
           intent2.answerthree = "answerthree"
           let interaction2 = INInteraction(intent: intent2, response: nil)
           interaction2.donate { (error) in
               if error != nil {
                   if let error = error as NSError? {
                      print("Interaction donation failed: \(error.description)")
                }  else {
                      print("Successfully donated interaction")
                }
            }
        }
        
            
            
        
        }
*/

    

 
        
        
    



/* alert1.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
               let alert2 = UIAlertController(title: nil,  message: "Do you want to go to the next question?", preferredStyle: .alert)
               alert2.addAction(UIAlertAction(title: "Yes", style: .default, handler:{ action in self.getdbb()
                   INInteraction(intent: GetQuestionIntent(), response: nil).donate(completion: nil)
               }))
               alert2.addAction(UIAlertAction(title :"No", style: .default, handler: nil ))
               self.present(alert2, animated: true, completion: nil)
      
               
               
               
           }))
*/

*/
