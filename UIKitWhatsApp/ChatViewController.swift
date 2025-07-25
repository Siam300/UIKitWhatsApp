//
//  ChatViewController.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/25/25.
//

import UIKit

class ChatViewController: UIViewController {

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
        
//        navigationController?.popViewController(animated: true)// back action
    }

    @objc func rightButtonTapped() {
        print("Right button tapped.")
    }
}
