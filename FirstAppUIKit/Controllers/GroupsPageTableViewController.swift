//
//  GroupsPage.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class GroupsPageTableViewController: UITableViewController, ThemeChangeDelegate, BackgroundColor{
    
    
    
    // MARK: PROTOCOLS FUNC
    func themeDidChanged(toTheme: ThemeType) {
        changeBackgroundColor()
    }
    
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

    
    
    // MARK: VARIABLES
    let networkService = NetworkService()
    let dataService = DataService()
    var groups = [Group]()

   
    
    // MARK: LIFE CYCLE FUNC
    override func viewDidLoad() {
        super.viewDidLoad()
        rowHeight()
        tableRegister()
        registerRefreshControl()
        groups = dataService.fetchGroups()
        netGetGroup()
        changeBackgroundColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        changeBackgroundColor()
    }
    
    
    
    // MARK: PRIVATE FUNC
    private func registerRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
    }
    
    private func rowHeight(){
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    private func tableRegister(){
        tableView.register(CustomGroupTableCell.self, forCellReuseIdentifier: CustomGroupTableCell.identifier)
    }
    
    
    
    // MARK: TABLE VIEW FUNC
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
    
    
    
    // MARK: NETWORK FUNC
    func netGetGroup(){
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
    

    
    // MARK: OBJ-C FUNC
    @objc func update() {
        netGetGroup()
    }
}


#Preview{
    GroupsPageTableViewController()
}

