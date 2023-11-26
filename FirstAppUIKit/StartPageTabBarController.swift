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
    
    private func generateTabBar(){
        viewControllers = [
            generateViewController(
                viewController: FriendsPageTableViewController(),
                title: "Friends",
                image: resizeImage(image: UIImage(named: "friends") ?? UIImage(), size: 30)),
            generateViewController(
                viewController: GroupsPageTableViewController(),
                title: "Groups",
                image: resizeImage(image: UIImage(named: "groups") ?? UIImage(), size: 30)),
            generateViewController(
                viewController: PhotosPageCollectionViewController(collectionViewLayout: .init()),
                title: "Photos",
                image: resizeImage(image: UIImage(named: "photos") ?? UIImage(), size: 30))
            
        ]
    }

    private func generateViewController(viewController: UIViewController, title: String, image: UIImage? )-> UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    func resizeImage(image: UIImage, size: CGFloat) -> UIImage? {
        let newSize = CGSize(width: size, height: size)
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    


}

#Preview {
    StartPageTabBarController()
}
