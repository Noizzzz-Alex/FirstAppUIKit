//
//  UserPageViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 09.12.2023.
//

import Foundation
import UIKit

final class UserPageViewController: UIViewController, ThemeChangeDelegate, BackgroundColor {
    
    
    
    // MARK: ProtocolsMethods
    func changeBackgroundColor() {
        switch CurrentTheme.currentTheme {
        case .light:
            view.backgroundColor = .white
            labelFirstName.textColor = .systemBlue
            labelLastName.textColor = .systemBlue
        case .dark:
            view.backgroundColor = .black
            labelFirstName.textColor = .systemPink
            labelLastName.textColor = .systemPink
        case .gray:
            view.backgroundColor = .gray
            labelFirstName.textColor = .systemYellow
            labelLastName.textColor = .systemYellow
        }
    }

    func themeDidChanged(toTheme: ThemeType) {
        switch toTheme {
        case .light:
            view.backgroundColor = .white
            labelFirstName.textColor = .systemBlue
            labelLastName.textColor = .systemBlue
        case .dark:
            view.backgroundColor = .black
            labelFirstName.textColor = .systemPink
            labelLastName.textColor = .systemPink
        case .gray:
            view.backgroundColor = .gray
            labelFirstName.textColor = .systemYellow
            labelLastName.textColor = .systemYellow
        }
    }

    
    
    // MARK: Variables
    let networkService = NetworkService()
    var users = [User]()
    static var isYouProfile = true

    var userImageProfile: UIImageView = {
        var photo = UIImageView()
        photo.image = UIImage(named: "person")
        photo.layer.cornerRadius = 25
        photo.clipsToBounds = true
        photo.backgroundColor = .clear
        photo.contentMode = .scaleAspectFit
        return photo
    }()

    var labelFirstName: UILabel = {
        let label = UILabel()
        label.text = "First Name"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textAlignment = .center
        return label
    }()

    var labelLastName: UILabel = {
        let label = UILabel()
        label.text = "Last Name"
        label.font = UIFont.systemFont(ofSize: 35)
        label.textAlignment = .center
        return label
    }()

    
    
    // MARK: LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackgroundColor()
        CurrentTheme.themeDelegate = self
        setupViews()
        if UserPageViewController.isYouProfile{
            load()
        }else{
            anotherLoad()
        }
    }

    
    
    // MARK: networkFunc
    func load() {
        networkService.getUser { [weak self] users in
            self?.users = users
            DispatchQueue.main.async {
                self?.configureView(users: users.first ?? User(firstName: "John", lastName: "Dow", photo: "default", id: 1))
            }
        }
    }
    func anotherLoad(){
        networkService.getAnotherUser { [weak self] users in
            self?.users = users
            DispatchQueue.main.async {
                self?.configureView(users: users.first ?? User(firstName: "John", lastName: "Dow", photo: "default", id: 1))
            }
        }
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
    
    
    
    // MARK: setupViews&Constraints
    private func setupViews() {
        view.addSubview(labelFirstName)
        view.addSubview(labelLastName)
        view.addSubview(userImageProfile)
        setupConstraintsView()
        let themeButton = UIBarButtonItem(title: "My Theme", style: .plain, target: self, action: #selector(themeButtonTapped))
        navigationItem.rightBarButtonItem = themeButton
    }

    private func setupConstraintsView() {
        labelFirstName.translatesAutoresizingMaskIntoConstraints = false
        labelLastName.translatesAutoresizingMaskIntoConstraints = false
        userImageProfile.translatesAutoresizingMaskIntoConstraints = false

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

        ])
    }

    
    
    // MARK: obj-c func
    @objc func themeButtonTapped() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .fade
        let themeVC = ThemePageController()
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(themeVC, animated: false)
    }
}

#Preview {
    UserPageViewController()
}
