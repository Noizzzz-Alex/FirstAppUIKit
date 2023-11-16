//
//  ViewController.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 16.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.image = UIImage(named: "NewImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        setupImage()
        setupConstraints()
        }

    private func setupImage(){
        view.addSubview(logoImage)
    }
    
    func setupConstraints(){
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // MARK: logoImage
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            logoImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 4)
            
            
        ])
    }
}
#Preview {
    ViewController()
}
