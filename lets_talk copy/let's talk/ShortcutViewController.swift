//
//  ShortcutViewController.swift
//  let's talk
//
//  Created by Shivani Kannan on 03/06/20.
//  Copyright © 2020 Shivani Kannan. All rights reserved.
//
import UIKit
import IntentsUI
import os.log

class ShortcutViewController: UIViewController {
    private let container = UIView()
    //what is shortcut view here?
    private let button = UIButton()
    private let activity: NSUserActivity?

    init(_ activity: NSUserActivity?) {
        self.activity = activity
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
    }
    

}

private extension ShortcutViewController {
    @objc func addSiriShortcutButtonPressed(_ sender: UIButton) {
        
        guard let shortcut1 = INShortcut(intent: GetQuestionIntent()) else {return}
        let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut1)

        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
        

    }
    
    func setUpSubviews() {
        view.backgroundColor = UIColor.white
        title = "CONVERSATION"
        view.addSubview(container)
        
        button.setTitle("Add Shortcuts to Siri", for: .normal)
        button.addTarget(self, action: #selector(addSiriShortcutButtonPressed(_:)), for: .touchUpInside)
        button.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(button)
        //again not billView
        
        
        addConstraints()
    }
    
    func addConstraints() {
    //what are these constraints?
        container.translatesAutoresizingMaskIntoConstraints = false
      
        button.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            guide.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 10),
            container.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10),
        
            
            button.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            guide.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10),
            button.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 10),
            button.heightAnchor.constraint(equalToConstant: 44),
            ])
        
    }
}

extension ShortcutViewController: INUIAddVoiceShortcutButtonDelegate {
    //error probably because of insufficient UI?
    func present(_ addVoiceShortcutViewController: INUIAddVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        addVoiceShortcutViewController.delegate = self
        present(addVoiceShortcutViewController, animated: true, completion: nil)
    }
    
    func present(_ editVoiceShortcutViewController: INUIEditVoiceShortcutViewController, for addVoiceShortcutButton: INUIAddVoiceShortcutButton) {
        editVoiceShortcutViewController.delegate = self
        present(editVoiceShortcutViewController, animated: true, completion: nil)
    }
}

extension ShortcutViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        if let error = error as NSError? {
            os_log("Error adding voice shortcut: %@", log: OSLog.default, type: .error, error)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        dismiss(animated: true, completion: nil)
    }
}

//no errors here but idk what it means lol

extension ShortcutViewController: INUIEditVoiceShortcutViewControllerDelegate {
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController,
                                         didUpdate voiceShortcut: INVoiceShortcut?,
                                         error: Error?) {
        if let error = error as NSError? {
            os_log("Error adding voice shortcut: %@", log: OSLog.default, type: .error, error)
        }
        
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewController(_ controller: INUIEditVoiceShortcutViewController,
                                         didDeleteVoiceShortcutWithIdentifier deletedVoiceShortcutIdentifier: UUID) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func editVoiceShortcutViewControllerDidCancel(_ controller: INUIEditVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}




