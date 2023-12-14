//
//  ThemeController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//

import Foundation
import UIKit

final class ThemeController: UIViewController {
    private var buttonChangeLight = Buttons.createSimpleButton(title: "Light Theme", state: .normal)
    private var buttonChangeDark = Buttons.createSimpleButton(title: "Dark Theme", state: .normal)
    private var buttonChangeGray = Buttons.createSimpleButton(title: "Gray Theme", state: .normal)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        Theme.isTheme(view: view)
    }
    override func viewDidAppear(_ animated: Bool) {
        Theme.isTheme(view: view)
    }

    private func setupViews() {
        view.addSubview(buttonChangeLight)
        view.addSubview(buttonChangeDark)
        view.addSubview(buttonChangeGray)
        setupConstraintsView()
        setupButtonAction()
    }

    private func setupConstraintsView() {
        buttonChangeLight.translatesAutoresizingMaskIntoConstraints = false
        buttonChangeDark.translatesAutoresizingMaskIntoConstraints = false
        buttonChangeGray.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // MARK: buttonChangeLight

            buttonChangeLight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            buttonChangeLight.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonChangeLight.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            // MARK: buttonChangeDark

            buttonChangeDark.topAnchor.constraint(equalTo: buttonChangeLight.bottomAnchor, constant: 30),
            buttonChangeDark.leadingAnchor.constraint(equalTo: buttonChangeLight.leadingAnchor),
            buttonChangeDark.trailingAnchor.constraint(equalTo: buttonChangeLight.trailingAnchor),

            // MARK: buttonChangeGray

            buttonChangeGray.topAnchor.constraint(equalTo: buttonChangeDark.bottomAnchor, constant: 30),
            buttonChangeGray.leadingAnchor.constraint(equalTo: buttonChangeDark.leadingAnchor),
            buttonChangeGray.trailingAnchor.constraint(equalTo: buttonChangeDark.trailingAnchor),

        ])
    }

    private func setupButtonAction() {
        buttonChangeDark.addTarget(self, action: #selector(tapDarkTheme), for: .touchUpInside)
        buttonChangeLight.addTarget(self, action: #selector(tapLightTheme), for: .touchUpInside)
        buttonChangeGray.addTarget(self, action: #selector(tapGrayTheme), for: .touchUpInside)
    }
//

//
}

private extension ThemeController {
    @objc func tapDarkTheme() {
        CurrentTheme.currentTheme = .dark
        view.backgroundColor = .black

        Theme.changeThemeButton(buttonLight: buttonChangeLight, buttonDark: buttonChangeDark, buttonGray: buttonChangeGray)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }

    @objc func tapLightTheme() {
        CurrentTheme.currentTheme = .light
        view.backgroundColor = .white
        Theme.changeThemeButton(buttonLight: buttonChangeLight, buttonDark: buttonChangeDark, buttonGray: buttonChangeGray)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .black
    }

    @objc func tapGrayTheme() {
        CurrentTheme.currentTheme = .gray
        view.backgroundColor = .gray
        Theme.changeThemeButton(buttonLight: buttonChangeLight, buttonDark: buttonChangeDark, buttonGray: buttonChangeGray)
        navigationController?.navigationBar.tintColor = .yellow
        navigationController?.navigationBar.barTintColor = .yellow
    }
}

#Preview {
    ThemeController()
}
