//
//  file.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//

import Foundation
import UIKit

extension FriendsPageTableViewController{
    
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Failed to retrieve data", message: "Data is not current", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


