//
//  ChatViewController.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/25/25.
//

import UIKit
import FirebaseAuth

struct MockUser {
    let name: String
    let imageName: String
    let lastMessage: String
    let date: String
}

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var listButton: UIButton!
    
    @IBOutlet weak var newGroupButton: UIButton!
    
    @IBOutlet weak var chatTableView: UITableView!
    
    let users: [MockUser] = [
        MockUser(name: "Alice Johnson", imageName: "person.circle.fill", lastMessage: "Hey! How’s it going?", date: "07/28/25"),
        MockUser(name: "Bob Smith", imageName: "person.circle.fill", lastMessage: "Let’s meet tomorrow.", date: "07/27/25"),
        MockUser(name: "Charlie Brown", imageName: "person.circle.fill", lastMessage: "See you soon!", date: "07/26/25"),
        MockUser(name: "David Clark", imageName: "person.circle.fill", lastMessage: "Call me when free.", date: "07/25/25"),
        MockUser(name: "Emily Davis", imageName: "person.circle.fill", lastMessage: "Thanks for the update!", date: "07/24/25"),
        MockUser(name: "Frank Miller", imageName: "person.circle.fill", lastMessage: "Sure, sounds good!", date: "07/23/25"),
        MockUser(name: "Grace Lee", imageName: "person.circle.fill", lastMessage: "Lunch later?", date: "07/22/25"),
        MockUser(name: "Henry Adams", imageName: "person.circle.fill", lastMessage: "That’s awesome!", date: "07/21/25"),
        MockUser(name: "Ivy Wilson", imageName: "person.circle.fill", lastMessage: "Where are you?", date: "07/20/25"),
        MockUser(name: "Jack White", imageName: "person.circle.fill", lastMessage: "On my way.", date: "07/19/25"),
        MockUser(name: "Karen Black", imageName: "person.circle.fill", lastMessage: "See you at 8.", date: "07/18/25"),
        MockUser(name: "Leo King", imageName: "person.circle.fill", lastMessage: "Thanks!", date: "07/17/25"),
        MockUser(name: "Mia Green", imageName: "person.circle.fill", lastMessage: "Talk later.", date: "07/16/25"),
        MockUser(name: "Noah Scott", imageName: "person.circle.fill", lastMessage: "Got it.", date: "07/15/25"),
        MockUser(name: "Olivia Young", imageName: "person.circle.fill", lastMessage: "Let’s plan soon.", date: "07/14/25"),
        MockUser(name: "Paul Walker", imageName: "person.circle.fill", lastMessage: "Sounds perfect.", date: "07/13/25"),
        MockUser(name: "Quinn Hill", imageName: "person.circle.fill", lastMessage: "All set!", date: "07/12/25"),
        MockUser(name: "Ruby Evans", imageName: "person.circle.fill", lastMessage: "Miss you!", date: "07/11/25"),
        MockUser(name: "Sam Turner", imageName: "person.circle.fill", lastMessage: "Okay!", date: "07/10/25"),
        MockUser(name: "Tina Brooks", imageName: "person.circle.fill", lastMessage: "Catch you soon.", date: "07/09/25")
    ]
    
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
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let users = users[indexPath.row]
        
        cell.nameLabel.text = users.name
        cell.personImageView.image = UIImage(systemName: users.imageName)
        cell.textlabel.text = users.lastMessage
        cell.dateLabel.text = users.date
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // deselect the row after selection
        
        let textChatVC = TextChatViewController()
        textChatVC.title = users[indexPath.row].name
        textChatVC.view.backgroundColor = .magenta// for test
        textChatVC.hidesBottomBarWhenPushed = true// hide tab bar when navigating to chat
        navigationController?.pushViewController(textChatVC, animated: true)
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
