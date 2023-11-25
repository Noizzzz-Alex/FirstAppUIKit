//
//  FirstPageAppViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 24.11.2023.
//

import UIKit

class StartPage: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
    }

    init() {
        super.init(nibName: nil, bundle: nil)

        let friends = FriendsPage()
        friends.title = "Friends"
        let groups = GroupsPage()
        let photos = PhotosPage()

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [friends, groups, photos]
//        tabBarController.
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    StartPage()
}
