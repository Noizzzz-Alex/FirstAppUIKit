//
//  FriendsPageViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

class FriendsPage: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            
            return 10
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return number of rows
            1
        }
//        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            "Section"
//        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            CustomTableViewCell()
        }
}
#Preview{
    FriendsPage()
}
