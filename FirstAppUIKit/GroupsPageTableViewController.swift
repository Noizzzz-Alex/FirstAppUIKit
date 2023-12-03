//
//  GroupsPage.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class GroupsPageTableViewController: UITableViewController {
    let request = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        request.getGroups()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
            return 5
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return number of rows
            1
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            CustomGroupTableCell()
        }
}
#Preview{
    GroupsPageTableViewController()
}

