//
//  ThemeController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 14.12.2023.
//

import Foundation
import UIKit

final class ThemePageController: UIViewController, BackgroundColor {
    
    
    
    //MARK: protocol func
    func changeBackgroundColor() {
        switch CurrentTheme.currentTheme{
            
        case .light:
            view.backgroundColor = UIColor.white
        case .dark:
            view.backgroundColor = UIColor.black
        case .gray:
            view.backgroundColor = UIColor.gray
        }
    }
    
    //MARK: Buttons
    private var buttonChangeLight: UIButton = {
        let button = UIButton()
        button.setTitle("Light", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.setTitleColor(.systemMint, for: .normal)
        button.setTitleColor(.systemRed, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var buttonChangeDark: UIButton = {
        let button = UIButton()
        button.setTitle("Dark", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.setTitleColor(.systemMint, for: .normal)
        button.setTitleColor(.systemRed, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var buttonChangeGray : UIButton = {
        let button = UIButton()
        button.setTitle("Gray", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.setTitleColor(.systemMint, for: .normal)
        button.setTitleColor(.systemRed, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
  
    
    //MARK: life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

    }
    
    
    
    //MARK: @IBAction func
    @IBAction func buttonDarkTapped(_ sender: UIButton){
        navigationController?.navigationBar.tintColor = UIColor.systemPink
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barStyle = .black
        tabBarController?.tabBar.tintColor = UIColor.systemPink
        tabBarController?.tabBar.backgroundColor = .black
        tabBarController?.tabBar.barStyle = .black
        sender.setTitleColor(.systemMint, for: .normal)
        CurrentTheme.currentTheme = .dark
        changeBackgroundColor()
    }
    
    @IBAction func buttonLightTapped(_ sender: UIButton){
        navigationController?.navigationBar.tintColor = UIColor.systemBlue
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barStyle = .default
        tabBarController?.tabBar.tintColor = UIColor.systemPink
        tabBarController?.tabBar.barStyle = .default
        tabBarController?.tabBar.backgroundColor = .white
        sender.setTitleColor(.systemMint, for: .normal)
        CurrentTheme.currentTheme = .light
        changeBackgroundColor()
    }
    @IBAction func buttonGrayTapped(_ sender: UIButton){
        navigationController?.navigationBar.tintColor = UIColor.systemYellow
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barStyle = .black
        tabBarController?.tabBar.tintColor = UIColor.systemYellow
        tabBarController?.tabBar.barStyle = .black
        tabBarController?.tabBar.backgroundColor = .gray
        sender.setTitleColor(.systemMint, for: .normal)
        CurrentTheme.currentTheme = .gray
        changeBackgroundColor()
    }
    
    
    
    //MARK: func actions
    private func sendActionForButtons(){
        buttonChangeDark.addTarget(self, action: #selector(buttonDarkTapped(_:)), for: .touchUpInside)
        buttonChangeLight.addTarget(self, action: #selector(buttonLightTapped(_:)), for: .touchUpInside)
        buttonChangeGray.addTarget(self, action: #selector(buttonGrayTapped(_:)), for: .touchUpInside)
    }
    
    //MARK: setup views&constraints
    private func setupViews() {
        view.addSubview(buttonChangeLight)
        view.addSubview(buttonChangeDark)
        view.addSubview(buttonChangeGray)
        sendActionForButtons()
        changeBackgroundColor()
        setupConstraintsView()
    }
    
    private func setupConstraintsView() {

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
}

#Preview {
    ThemePageController()
}
