//
//  FirstPageAppViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 24.11.2023.
//

import UIKit
class MainTabBarViewController: UIViewController {
    private var myTabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        myTabBarController.viewControllers = [
            generateViewController(viewController: FriendsPageTableViewController(), imageName: "friends", title: "Friends"),
            generateViewController(viewController: GroupsPageTableViewController(), imageName: "groups", title: "Groups"),
            generateViewController(viewController: PhotosPageCollectionViewController(collectionViewLayout: .init()), imageName: "photos", title: "Photos"),
        ]

        addChild(myTabBarController)
        view.addSubview(myTabBarController.view)
        myTabBarController.didMove(toParent: self)
        myTabBarController.tabBar.frame = CGRect(
            x: Int(myTabBarController.tabBar.frame.origin.x),
            y: Int(myTabBarController.tabBar.frame.origin.y),
            width: Int(myTabBarController.tabBar.frame.size.width),
            height: 50)
    }

    private func generateViewController(
        viewController: UIViewController, imageName: String, title: String) -> UIViewController {
        let controller = UINavigationController(rootViewController: viewController)
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.tabBarItem.title = title
        return controller
    }
}

#Preview {
    MainTabBarViewController()
}
