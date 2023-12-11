//
//  ViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 16.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    private var table: UITableView = {
        let webView = UITableView()
        return webView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.addSubview(table)
        table.backgroundColor = .black
        setupConstraints(controller: table)
    }

    private func setupConstraints(controller: UITableView) {
        controller.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            controller.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            controller.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            controller.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

    
#Preview {
    ViewController()
}
