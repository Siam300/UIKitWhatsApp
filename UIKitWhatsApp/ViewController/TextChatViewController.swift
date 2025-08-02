//
//  TextChatViewController.swift
//  UIKitWhatsApp
//
//  Created by Auto on 8/1/25.
//

import UIKit
import MessageKit
import FirebaseAuth

class TextChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    let currentUser = Sender(senderId: "SenderId", displayName: "Display Name")
    let otherUser = Sender(senderId: "OtherSenderId", displayName: "Other Display Name")
    var messages = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hello, how are you?")))
        
        messages.append(Message(sender: otherUser,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-76400),
                                kind: .text("Yeah, I'm fine. Thanks for asking. Hello, how are you?")))
        
        messages.append(Message(sender: currentUser,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-66400),
                                kind: .text("Thanks for asking, I'm also doing well.")))
        
        messages.append(Message(sender: otherUser,
                                messageId: "4",
                                sentDate: Date().addingTimeInterval(-56400),
                                kind: .text("Glad to hear that!")))
        
        // Do any additional setup after loading the view.
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    func currentSender() -> any MessageKit.SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
}
