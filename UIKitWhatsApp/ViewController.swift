//
//  ViewController.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/20/25.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var countries: UIMenu!
    
    @IBOutlet weak var countryButton: UIButton!
    
    @IBOutlet weak var numPad: UITextField!
    
    @IBOutlet weak var otpField: UITextField!
    
    var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Phone Number"
        
        doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        doneButton.isEnabled = false
        navigationItem.rightBarButtonItem = doneButton
        
        numPadView()
        otpPadView()
        setupPopUpButton()
    }
    
    @objc func doneTapped() {
        print("Done button tapped.")
        
        let vc = ChatViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func rightButtonTapped() {
        print("Right button tapped.")
    }
    
    func numPadView() {
        numPad.placeholder = "Enter Phone Number"
        numPad.keyboardType = .numberPad
        
        numPad.delegate = self
        numPad.inputAccessoryView = createToolbar(for: numPad)
    }

    func otpPadView() {
        otpField.placeholder = "Enter OTP Code"
        otpField.keyboardType = .numberPad
        
        otpField.delegate = self
        otpField.inputAccessoryView = createToolbar(for: otpField)
    }
    
    func createToolbar(for textField: UITextField) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped(_:)))

        // Use tag to identify which field this toolbar belongs to
        textField.tag = textField == numPad ? 1 : 2

        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        return toolbar
    }

    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        if numPad.isFirstResponder {
            _ = textFieldShouldReturn(numPad)
        } else if otpField.isFirstResponder {
            _ = textFieldShouldReturn(otpField)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if textField == numPad {
            if let text = textField.text, !text.isEmpty {
                let number = text
                
                // verification
                AuthManager.shared.startAuth(phoneNumber: number) { [weak self] success in
                    guard success else { return }
                    
                    DispatchQueue.main.async {
                        self?.otpField.becomeFirstResponder()
                    }
                }
            }
        } else if textField == otpField {
            guard let code = otpField.text, !code.isEmpty else {
                return false
            }
            
            AuthManager.shared.verifyCode(smsCode: code) { [weak self] success in
                guard success else {
                    return 
                }
                
                DispatchQueue.main.async {
                    self?.doneTapped()
                }
            }
        }
        
         return true
    }
            
    @IBAction func setupPopUpButton() {
        let popUpButtonClosure = { (action: UIAction) in
            print("Pop-up action")
        }
                
        countryButton.menu = UIMenu(children: [
            UIAction(title: "First Country", handler: popUpButtonClosure),
            UIAction(title: "Second Country", handler: popUpButtonClosure),
            UIAction(title: "last Country", handler: popUpButtonClosure)
            
        ])
        countryButton.showsMenuAsPrimaryAction = true
    }
}
