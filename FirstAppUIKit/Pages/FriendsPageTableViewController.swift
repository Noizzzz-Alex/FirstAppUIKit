//
//  FriendsPageViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class FriendsPageTableViewController: UITableViewController, changeTheme {
    func change() {
        switch CurrentTheme.currentTheme {
        case .light:
            view.backgroundColor = .white
        case .dark:
            view.backgroundColor = .black
        case .gray:
            view.backgroundColor = .gray
        }

        for indexPath in tableView.indexPathsForVisibleRows ?? [] {
            if let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell {
                cell.settingThemeCell()
            }
        }
    }

    let networkService = NetworkService()
    let dataService = DataService()
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        friends = dataService.fetchFriends()
        Theme.isTheme(view: tableView)
        change()

        let profileButton = UIBarButtonItem(title: "My Profile", style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)

        networkService.getFriends { [weak self] results in
            switch results {
            case let .success(friends):
                self?.friends = friends
                self?.dataService.addFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure:
                self?.friends = self?.dataService.fetchFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Theme.isTheme(view: tableView)
        change()
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
        let model = friends[indexPath.row]
        cell.configureCell(friends: model)
//        cell.tap = { [weak self] firstName, lastName, photo in
//            self?.tableViewCellTapped(with: model.self)
//        }

        return cell
    }
    func tableViewCellTapped(with model: Friend) {
        var image = UIImageView()
        DispatchQueue.global().async {
            if let url = URL(string: model.photo),
               let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    image.image = UIImage(data: data)
                }
            }
        }
//        let profileVC = ProfileFriendPage(image: image.image ?? UIImage(), firstName: model.firstName, lastName: model.lastName)
//      navigationController?.pushViewController(profileVC, animated: true)
    }

    @objc func profileButtonTapped() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .fade
        let profileVC = UserPageViewController()
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(profileVC, animated: false)
    }

    @objc func update() {
        networkService.getFriends { [weak self] results in
            switch results {
            case let .success(friends):
                self?.friends = friends
                self?.dataService.addFriends(friends: friends)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure:
                self?.friends = self?.dataService.fetchFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
}

    
    
    
    
#Preview {
    FriendsPageTableViewController()
}
