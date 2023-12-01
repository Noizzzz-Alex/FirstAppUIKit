//
//  CustomTableViewCell.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private var circle: UIView = {
            let circle = UIView()
            circle.backgroundColor = .systemFill
            circle.layer.cornerRadius = 25
            return circle
        }()

        private var text1: UILabel = {
            let label = UILabel()
            label.text = "Friend"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 30)
            return label
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = .white
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupViews() {
            
            contentView.addSubview(circle)
            contentView.addSubview(text1)
            setupConstraints()
        }
        
        private func setupConstraints(){
            contentView.translatesAutoresizingMaskIntoConstraints = false
            circle.translatesAutoresizingMaskIntoConstraints = false
            text1.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                circle.heightAnchor.constraint(equalToConstant: 50),
                circle.widthAnchor.constraint(equalToConstant: 50),
                circle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                text1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                text1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                text1.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 30),
                text1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
                
                
            ])
        }

}
