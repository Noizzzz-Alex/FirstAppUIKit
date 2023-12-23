//
//  FriendsPageViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class FriendsPageTableViewController: UITableViewController,ThemeChangeDelegate, BackgroundColor  {
    
    
    
    // MARK: ProtocolsMethods
    func changeBackgroundColor() {
        switch CurrentTheme.currentTheme {
        case .light:
            view.backgroundColor = .white
            tabBarController?.tabBar.barStyle = .default
            navigationController?.navigationBar.backgroundColor = .white
            navigationController?.navigationBar.barTintColor = .white
            navigationController?.navigationBar.barStyle = .default
        case .dark:
            view.backgroundColor = .black
            tabBarController?.tabBar.barStyle = .black
            navigationController?.navigationBar.backgroundColor = .black
            navigationController?.navigationBar.barTintColor = .black
            navigationController?.navigationBar.barStyle = .black
        case .gray:
            view.backgroundColor = .gray
            tabBarController?.tabBar.barStyle = .black
            navigationController?.navigationBar.backgroundColor = .gray
            navigationController?.navigationBar.barTintColor = .gray
            navigationController?.navigationBar.barStyle = .black
        }
        tableView.reloadData()
    }
    
    func themeDidChanged(toTheme: ThemeType) {
        changeBackgroundColor()
    }
    
    
    
    // MARK: VARIABLES
    let networkService = NetworkService()
    let dataService = DataService()
    var friends = [Friend]()
    
    
    
    // MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        netGetFriends()
        registerNavigationButton()
        registerRefreshControl()
        changeBackgroundColor()
        CurrentTheme.themeDelegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeBackgroundColor()
    }
    
    
    // MARK: TABLE VIEW
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
        switch CurrentTheme.currentTheme {
        case .light:
            cell.changeBackgroundColor()
            
        case .dark:
            cell.changeBackgroundColor()
        case .gray:
            cell.changeBackgroundColor()
        }
        return cell
    }
    
    
    
    // MARK: PRIVATE FUNC
    private func tableViewCellTapped(with model: Friend) {
        let image = UIImageView()
        DispatchQueue.global().async {
            if let url = URL(string: model.photo),
               let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    image.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func netGetFriends(){
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
    
    private func registerNavigationButton(){
        let profileButton = UIBarButtonItem(title: "My Profile", style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.rightBarButtonItem = profileButton
    }
    
    private func registerRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
    }
    
    
    
    // MARK: OBJ-C FUNC
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
        netGetFriends()
    }
}

    
    
    
    
#Preview {
    FriendsPageTableViewController()
}
