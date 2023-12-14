//
//  GroupsPage.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class GroupsPageTableViewController: UITableViewController, changeTheme {
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
            if let cell = tableView.cellForRow(at: indexPath) as? CustomGroupTableCell {
                cell.settingThemeCell()
            }
        }
    }
    
    let networkService = NetworkService()
    let dataService = DataService()
    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        groups = dataService.fetchGroups()
        Theme.isTheme(view: view)
        change()
        tableView.register(CustomGroupTableCell.self, forCellReuseIdentifier: CustomGroupTableCell.identifier)
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
        
        
        networkService.getGroups { [weak self] results in
            switch results {
            case .success(let groups):
                self?.groups = groups
                self?.dataService.addGroup(groups: groups)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure:
                self?.groups = self?.dataService.fetchGroups() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        Theme.isTheme(view: view)
        change()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomGroupTableCell.identifier,
            for: indexPath) as? CustomGroupTableCell else {
                return UITableViewCell()
        }
        cell.configureCell(groups: groups[indexPath.row])
        return cell
    }
    @objc func update() {
        networkService.getGroups { [weak self] results in
            switch results {
            case .success(let groups):
                self?.groups = groups
                self?.dataService.addGroup(groups: groups)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure:
                self?.groups = self?.dataService.fetchGroups() ?? []
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
#Preview{
    GroupsPageTableViewController()
}

