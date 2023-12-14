//
//  FirstPageAppViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 24.11.2023.
//

import UIKit

final class StartPageTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Theme.isTheme(view: view)
    }
    

    private func generateTabBar() {
        viewControllers = [
            generateViewController(viewController: FriendsPageTableViewController(), imageName: "friends", title: "Friends", largeTitle: true),
            generateViewController(viewController: GroupsPageTableViewController(), imageName: "groups", title: "Groups", largeTitle: true),
            generateViewController(viewController: PhotosPageCollectionViewController(collectionViewLayout: .init()), imageName: "photos", title: "Photos", largeTitle: true),
        ]
    }

    // метод для генерации контроллеров
    private func generateViewController(
        viewController: UIViewController, imageName: String, title: String, largeTitle: Bool) -> UIViewController {
        // оборачиваем контроллер в навигешн контроллер
        let controller = UINavigationController(rootViewController: viewController)

        // добавляем на таббар иконку контроллера
        controller.tabBarItem.image = UIImage(named: imageName)
        controller.navigationBar.tintColor = .blue

        // добавляем на таббар название контроллера
        controller.tabBarItem.title = title

        // добавляем на верхний колонтитут надпись
        viewController.navigationItem.title = title
        // указываем большой ли будет титул
        controller.navigationBar.prefersLargeTitles = largeTitle
        return controller
    }
}

#Preview {
    StartPageTabBarController()
}