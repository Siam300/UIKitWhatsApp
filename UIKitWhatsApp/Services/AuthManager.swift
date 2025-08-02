//
//  AuthManager.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/26/25.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    
    let auth = Auth.auth()
    var verificationID: String?
    
    func startAuth(phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber) { [weak self] (verificationID, error) in
            guard let verificationID = verificationID, error == nil else {
                completion(false)
                return
            }
            self?.verificationID = verificationID
            completion(true)
        }
    }
    
    func verifyCode(smsCode: String, completion: @escaping (Bool) -> Void) {
        guard let vertexificationID = verificationID else {
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: vertexificationID,
            verificationCode: smsCode
        )
        
        auth.signIn(with: credential) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            
            completion(true)
        }
    }
}
