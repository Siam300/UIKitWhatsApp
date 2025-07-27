//
//  ChatViewController.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/25/25.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var listButton: UIButton!
    
    @IBOutlet weak var newGroupButton: UIButton!
    
    @IBOutlet weak var chatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Chats"
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightButtonTapped))
    }
    
    @objc func editButtonTapped() {
        print("Edit button tapped.")

        
        //log out code
//        do {
//            try Auth.auth().signOut() // Firebase sign out
//            
//            if let nav = navigationController {
//                nav.popViewController(animated: true)
//            } else {
//                dismiss(animated: true)
//            }
//        } catch let signOutError as NSError {
//            print("DEBUG: Error signing out: %@", signOutError)
//        }
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
        
//        navigationController?.popViewController(animated: true)// back action
    }

    @objc func rightButtonTapped() {
        print("Right button tapped.")
    }
}
