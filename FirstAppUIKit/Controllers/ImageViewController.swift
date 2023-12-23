//
//  ImageViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class ImageViewController: UIViewController,BackgroundColor {
    
    
    
    // MARK: PROTOCOL FUNC
    func changeBackgroundColor() {
        switch CurrentTheme.currentTheme{
            
        case .light:
            view.backgroundColor = .white
            navigationController?.navigationBar.tintColor = .systemBlue
        case .dark:
            view.backgroundColor = .black
            navigationController?.navigationBar.tintColor = .systemPink
        case .gray:
            view.backgroundColor = .gray
            navigationController?.navigationBar.tintColor = .systemYellow
        }
    }
    
    
    
    // MARK: VARIABLES
    private var imageView = UIImageView()
    
    
    
    // MARK: INITIALISATION
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = image
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    // MARK: LIFE CUCLE FUNC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        changeBackgroundColor()

    }

    
    
    // MARK: CONSTRAINTS
    private func setupView() {
        view.addSubview(imageView)
        setupConstraints()
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
    }
}
