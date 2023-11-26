//
//  ViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 16.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "NewImage")

        // масштабирование, сохраняет соотношение сторон
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

//    private let autorizationImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .white
//        imageView.image = UIImage(named: "AutorizationImage")
//
//        // масштабирование, сохраняет соотношение сторон
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()

//    private let labelAutorization: UILabel = {
//        let label = UILabel()
//        label.text = "Wellcome, please sign in"
//
//        // установка размера шрифта для лейбла
//        label.font = UIFont.systemFont(ofSize: 30)
    ////        label.backgroundColor = .cyan
//        label.textColor = .black
//        label.textAlignment = .center
//
//        return label
//    }()

    private let loginField: UITextField = {
        let login = UITextField()
        login.placeholder = "login"
        login.font = UIFont.systemFont(ofSize: 30)
        login.backgroundColor = .white
        login.textColor = .black
        login.borderStyle = .bezel
        return login
    }()

    private let passwordField: UITextField = {
        let password = UITextField()
        password.placeholder = "password"
        password.font = UIFont.systemFont(ofSize: 30)
        password.backgroundColor = .white
        password.textColor = .black
        password.borderStyle = .bezel
        // установка скрытого текста
        password.isSecureTextEntry = true
        return password
    }()

    private let buttonEnter: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Signing", for: .highlighted)
//        button.backgroundColor = .cyan
        button.setImage(UIImage(named: "ButtonEnter"), for: .normal)
        button.contentMode = .scaleAspectFill
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupImage()
        setupConstraints()
        buttonEnter.addTarget(StartPageTabBarController(), action: #selector(goToNextScreen), for: .touchUpInside)
    }

    private func setupImage() {
        view.addSubview(logoImage)
//        view.addSubview(labelAutorization)
//        view.addSubview(autorizationImage)
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(buttonEnter)
    }

    private func setupConstraints() {
        logoImage.translatesAutoresizingMaskIntoConstraints = false
//        labelAutorization.translatesAutoresizingMaskIntoConstraints = false
        loginField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        buttonEnter.translatesAutoresizingMaskIntoConstraints = false
//        autorizationImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // MARK: logoImage

            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            logoImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 3),

            // MARK: LabelAutorization

//            labelAutorization.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 5),
//            labelAutorization.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            labelAutorization.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            labelAutorization.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            labelAutorization.heightAnchor.constraint(equalToConstant: view.frame.size.height / 10),

            // MARK: AutorizationImage

//            autorizationImage.topAnchor.constraint(equalTo: labelAutorization.bottomAnchor, constant: 30),
//            autorizationImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            autorizationImage.leadingAnchor.constraint(equalTo: labelAutorization.leadingAnchor),
//            autorizationImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 7),

            // MARK: LoginField

            loginField.topAnchor.constraint(equalTo: passwordField.topAnchor, constant: -60),
            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginField.heightAnchor.constraint(equalToConstant: view.frame.size.height / 20),

            // MARK: passwordField

//            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 20),
            passwordField.bottomAnchor.constraint(equalTo: buttonEnter.topAnchor, constant: -40),
            passwordField.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
            passwordField.centerXAnchor.constraint(equalTo: loginField.centerXAnchor),
            passwordField.heightAnchor.constraint(equalTo: loginField.heightAnchor),

            // MARK: EnterButton

//            buttonEnter.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant:130),
            buttonEnter.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buttonEnter.heightAnchor.constraint(equalToConstant: view.frame.size.height / 8),
            buttonEnter.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor, constant: 110),
            buttonEnter.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor, constant: -110),

        ])
    }
//    @objc func goToCollectionView() {
//        navigationController?.pushViewController(
//            PhotosPageCollectionViewController(
//                collectionViewLayout: UICollectionViewFlowLayout()
//            ),
//            animated: true
//        )
//    }
}

// MARK: Objective-C Methods

private extension ViewController {
    @objc func goToNextScreen() {
        navigationController?.pushViewController(StartPageTabBarController(), animated: true)
    }
}



#Preview {
    ViewController()
}
