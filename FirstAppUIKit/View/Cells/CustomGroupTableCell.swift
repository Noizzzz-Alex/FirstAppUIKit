//
//  CustomGroupTableCell.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 26.11.2023.
//

import UIKit

class CustomGroupTableCell: UITableViewCell, BackgroundColor {
    func changeBackgroundColor() {
        switch CurrentTheme.currentTheme {
        case .light:
            contentView.backgroundColor = UIColor.white
            labelHigh.textColor = UIColor.black
            labelLow.textColor = UIColor.black
            borderLabel.layer.borderColor = UIColor.black.cgColor
        case .dark:
            contentView.backgroundColor = UIColor.black
            labelHigh.textColor = UIColor.white
            labelLow.textColor = UIColor.white
            borderLabel.layer.borderColor = UIColor.white.cgColor
        case .gray:
            contentView.backgroundColor = UIColor.gray
            labelHigh.textColor = UIColor.systemMint
            labelLow.textColor = UIColor.systemMint
            borderLabel.layer.borderColor = UIColor.black.cgColor
        }
    }

    
    
    
    static let identifier = "GroupCell"

    let labelHigh: UILabel = {
        let label = UILabel()
        label.text = "Groups Name"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    let labelLow: UILabel = {
        let label = UILabel()
        label.text = "Groups Description"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    let borderLabel: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var groupPhoto: UIImageView = {
        var photo = UIImageView()
        photo.image = UIImage(named: "person")
        photo.layer.cornerRadius = 25
        photo.clipsToBounds = true
        photo.backgroundColor = .clear
        photo.contentMode = .scaleAspectFit
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()

    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
    func configureCell(groups: Group) {
        labelHigh.text = groups.name
        labelHigh.textAlignment = .center
        labelLow.text = groups.description
        DispatchQueue.global().async {
            if let url = URL(string: groups.photo),
               let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.groupPhoto.image = UIImage(data: data)
                }
            }
        }
    }

    
    
    
    private func setupViews() {
        contentView.addSubview(groupPhoto)
        contentView.addSubview(labelHigh)
        contentView.addSubview(labelLow)
        contentView.addSubview(borderLabel)
        setupConstraintsCell()
    }

    private func setupConstraintsCell() {
        NSLayoutConstraint.activate([
            // MARK: BORDER LABEL
            borderLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            borderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            borderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            borderLabel.heightAnchor.constraint(equalToConstant: 3),

            // MARK: GROUP PHOTO
            groupPhoto.topAnchor.constraint(equalTo: borderLabel.bottomAnchor, constant: 10),
            groupPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            groupPhoto.heightAnchor.constraint(equalToConstant: 50),
            groupPhoto.widthAnchor.constraint(equalToConstant: 50),

            // MARK: LABEL HIGH
            labelHigh.topAnchor.constraint(equalTo: borderLabel.bottomAnchor, constant: 10),
            labelHigh.leadingAnchor.constraint(equalTo: groupPhoto.trailingAnchor, constant: 10),
            labelHigh.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),

            // MARK: LABEL LOW
            labelLow.topAnchor.constraint(equalTo: labelHigh.bottomAnchor, constant: 10),
            labelLow.leadingAnchor.constraint(equalTo: labelHigh.leadingAnchor),
            labelLow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelLow.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20),

        ])
    }
}


#Preview {
    CustomGroupTableCell()
}
