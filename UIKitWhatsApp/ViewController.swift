//
//  ViewController.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/20/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countrySelection: UIButton!
    
    @IBOutlet weak var numPad: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Phone Number"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneTapped))
        numPadView()
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
    }
}

