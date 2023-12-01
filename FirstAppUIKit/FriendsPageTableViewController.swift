//
//  FriendsPageViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class FriendsPageTableViewController: UITableViewController {
    let networkService = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getFriends()

    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return number of rows
        5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CustomTableViewCell()
    }

}

#Preview {
    FriendsPageTableViewController()
}
