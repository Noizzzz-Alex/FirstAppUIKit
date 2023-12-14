//
//  UserPageViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 09.12.2023.
//

import Foundation
import UIKit

final class UserPageViewController: UIViewController {
    let networkService = NetworkService()
    var users = [User]()
    

    var userImageProfile = UIImageView()
    var labelFirstName = Labels.createLabel(text: "", fontSize: 30, textAlignment: .center, borderWidth: 0, cornerRadius: 5)
    var labelLastName = Labels.createLabel(text: "", fontSize: 30, textAlignment: .center, borderWidth: 0, cornerRadius: 5)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        load()
        let themeButton = UIBarButtonItem(title: "My Theme", style: .plain, target: self, action: #selector(themeButtonTapped))
        navigationItem.rightBarButtonItem = themeButton
        Theme.isTheme(view: view)
    }
    
    func load() {
        networkService.getUser { [weak self] users in
            self?.users = users
            DispatchQueue.main.async {
                self?.configureView(users: users.first ?? User(firstName: "John", lastName: "Dow", photo: "default", id: 1))
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        Theme.isTheme(view: view)
    }

    

    func configureView(users: User) {
        labelFirstName.text = users.firstName
        labelLastName.text = users.lastName
        DispatchQueue.global().async {
            guard let url = URL(string: users.photo),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self.userImageProfile.image = image
            }
        }
    }

    private func setupViews() {
        view.addSubview(labelFirstName)
        view.addSubview(labelLastName)
        view.addSubview(userImageProfile)
//        view.addSubview(button)
        setupConstraintsView()
    }

    private func setupConstraintsView() {
        labelFirstName.translatesAutoresizingMaskIntoConstraints = false
        labelLastName.translatesAutoresizingMaskIntoConstraints = false
        userImageProfile.translatesAutoresizingMaskIntoConstraints = false
//        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // MARK: User Image

            userImageProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            userImageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            userImageProfile.heightAnchor.constraint(equalToConstant: 350),
            userImageProfile.widthAnchor.constraint(equalToConstant: 350),

            // MARK: labelFirstName

            labelFirstName.topAnchor.constraint(equalTo: userImageProfile.bottomAnchor, constant: 50),
            labelFirstName.centerXAnchor.constraint(equalTo: userImageProfile.centerXAnchor),
            labelFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelFirstName.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            // MARK: labelLastName

            labelLastName.topAnchor.constraint(equalTo: labelFirstName.bottomAnchor, constant: 12.5),
            labelLastName.leadingAnchor.constraint(equalTo: labelFirstName.leadingAnchor),
            labelLastName.trailingAnchor.constraint(equalTo: labelFirstName.trailingAnchor),
            
//            //MARK: button
//            
//            button.topAnchor.constraint(equalTo: labelLastName.bottomAnchor, constant: 30),
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
    @objc func themeButtonTapped() {
    let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .fade
    let themeVC = ThemeController()
        navigationController?.view.layer.add(transition, forKey: nil)
    navigationController?.pushViewController(themeVC, animated: false)
    }
    
}


#Preview {
    UserPageViewController()
}
