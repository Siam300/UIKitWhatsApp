//
//  ChatViewController.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/25/25.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var listButton: UIButton!
    
    @IBOutlet weak var newGroupButton: UIButton!
    
    @IBOutlet weak var chatTableView: UITableView!
    
    let users = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Chats"
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(rightButtonTapped))
        
        chatTableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell// crash: *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'cell reuse indentifier in nib (tableViewCell) does not match the identifier used to register the nib (TableViewCell)'
        
        cell.nameLabel.text = "Test User \(indexPath.row)"
        cell.personImageView.image = UIImage(systemName: "person.circle.fill")
        cell.textlabel.text = "Hello, world!"
        cell.dateLabel.text = "01/01/01"
        
        return cell
    }
    
    @objc func editButtonTapped() {
        print("Edit button tapped.")
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
        
    }

    @objc func rightButtonTapped() {
        print("Right button tapped.")
    }
}
