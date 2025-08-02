//
//  Model.swift
//  UIKitWhatsApp
//
//  Created by Auto on 8/2/25.
//

import Foundation
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String = ""
    var sentDate: Date
    var kind: MessageKind
}
