//
//  FriendsPageViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class FriendsPageTableViewController: UITableViewController {
    let networkService = NetworkService()
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let profileButton = UIBarButtonItem(title: "My Profile", style: .plain, target: self, action: #selector(profileButtonTapped))
            navigationItem.rightBarButtonItem = profileButton
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        networkService.getFriends { [weak self] friends in
            self?.friends = friends
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath) as? CustomTableViewCell else {
                return UITableViewCell()
        }
        cell.configureCell(friends: friends[indexPath.row])
        return cell
    }
    
    
    @objc func profileButtonTapped() {
    let transition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .fade
    let profileVC = UserPageViewController()
        navigationController?.view.layer.add(transition, forKey: nil)
    navigationController?.pushViewController(profileVC, animated: false)
    }
}

#Preview {
    FriendsPageTableViewController()
}
