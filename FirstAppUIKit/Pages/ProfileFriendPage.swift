//
//  ProfileFriendPage.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//

import Foundation
import UIKit
final class ProfileFriendPage: UIViewController {
    private var firstName: String = ""
    private var lastName: String = ""
    private var photo: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupView()
        Theme.isTheme(view: view)
    }

    var userImageProfile = UIImageView()
    var labelFirstName = Labels.createLabel(text: "" , fontSize: 30, textAlignment: .center, borderWidth: 0, cornerRadius: 5)
    var labelLastName = Labels.createLabel(text: "", fontSize: 30, textAlignment: .center, borderWidth: 0, cornerRadius: 5)

    private func setupViews() {
//        view.addSubview(labelFirstName)
//        view.addSubview(labelLastName)
//        view.addSubview(userImageProfile)
        setupConstraintsView()
    }

    private func setupConstraintsView() {
//        labelFirstName.translatesAutoresizingMaskIntoConstraints = false
//        labelLastName.translatesAutoresizingMaskIntoConstraints = false
//        userImageProfile.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // MARK: User Image

//
//            userImageProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//            userImageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            userImageProfile.heightAnchor.constraint(equalToConstant: 350),
//            userImageProfile.widthAnchor.constraint(equalToConstant: 350),
//
//            // MARK: labelFirstName
//
//            labelFirstName.topAnchor.constraint(equalTo: userImageProfile.bottomAnchor, constant: 50),
//            labelFirstName.centerXAnchor.constraint(equalTo: userImageProfile.centerXAnchor),
//            labelFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            labelFirstName.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//
//            // MARK: labelLastName
//
//            labelLastName.topAnchor.constraint(equalTo: labelFirstName.bottomAnchor, constant: 12.5),
//            labelLastName.leadingAnchor.constraint(equalTo: labelFirstName.leadingAnchor),
//            labelLastName.trailingAnchor.constraint(equalTo: labelFirstName.trailingAnchor)

        ])
    }
}
