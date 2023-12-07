//
//  GroupsPage.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class GroupsPageTableViewController: UITableViewController {
    let networkService = NetworkService()
    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomGroupTableCell.self, forCellReuseIdentifier: CustomGroupTableCell.identifier)
        networkService.getGroups { [weak self] groups in
            self?.groups = groups
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
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
}
//#Preview{
//    GroupsPageTableViewController()
//}

