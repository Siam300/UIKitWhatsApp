//
//  MainTabBarController.swift
//  UIKitWhatsApp
//
//  Created by Auto on 7/27/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let chatVC = storyboard.instantiateViewController(withIdentifier: "chatView") as? ChatViewController
        else {
            print("chatView not found")
            return
        }
        
        let vc1 = UINavigationController(rootViewController: StatusViewController())
        let vc2 = UINavigationController(rootViewController: CallsViewController())
        let vc3 = UINavigationController(rootViewController: CameraViewController())
        let vc4 = UINavigationController(rootViewController: chatVC)
        let vc5 = UINavigationController(rootViewController: SettingsViewController())

        vc1.title = "Status"
        vc2.title = "Calls"
        vc3.title = "Camera"
        vc4.title = "Chats"
        vc5.title = "Settings"

        self.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        self.selectedIndex = 3
        
        let images = [
            "circle.dotted", "phone.fill", "camera.fill", "bubble.left.and.bubble.right.fill", "gear"
        ]

        self.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)

        guard let items = tabBar.items else { return }
        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }

        tabBar.backgroundColor = .white
    }
}

class StatusViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Home"
    }
}

class CallsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Contact"
    }
}

class CameraViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Help"
    }
}

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Settings"
    }
}
