//
//  CustomCollectionViewCell.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var tap: ((UIImage) -> Void)? // замыкание, принимающее на вход картинку при тапу

    // UIImageView это контейнер для картинки, чтобы картинку можно было положить на вью.Внутрь контейнера передаем картинку
    private var imageView = UIImageView(image: UIImage(named: "Image 1"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()

        //распознавание действий(тап) и добавление его в ячейку
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recognizer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews(){
        addSubview(imageView)
        setupConstraints()
    }

    private func setupConstraints(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @objc func cellTap(){
        tap?(imageView.image ?? UIImage())
    }

    
    
    
}
