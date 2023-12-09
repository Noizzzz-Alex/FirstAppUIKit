//
//  CustomGroupTableCell.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 26.11.2023.
//

import UIKit

class CustomGroupTableCell: UITableViewCell {
    
    static let identifier = "GroupCell"
    private var labelHigh = Labels.createLabel(text: "Text_1", fontSize: 25, textAlignment: .natural, textColor: .black, userBorderColor: .white, borderWidth: 0, cornerRadius: 0)
    private var labelLow = Labels.createLabel(text: "Text_2", fontSize: 15, textAlignment: .natural, textColor: .black, userBorderColor: .white, borderWidth: 0, cornerRadius: 0)
    
    private var groupPhoto = UIImageView()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(groups: Group) {
        labelHigh.text = groups.name
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
        setupConstraintsCell()
    }

    private func setupConstraintsCell() {
        groupPhoto.translatesAutoresizingMaskIntoConstraints = false
        labelHigh.translatesAutoresizingMaskIntoConstraints = false
        labelLow.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // MARK: GROUP PHOTO
            groupPhoto.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            groupPhoto.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            groupPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            groupPhoto.heightAnchor.constraint(equalToConstant: 50),
            groupPhoto.widthAnchor.constraint(equalToConstant: 50),

            // MARK: LABEL HIGH

            labelHigh.topAnchor.constraint(equalTo: groupPhoto.topAnchor),
            labelHigh.leadingAnchor.constraint(equalTo: groupPhoto.trailingAnchor, constant: 20),
            labelHigh.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
            
            // MARK: LABEL LOW
            labelLow.topAnchor.constraint(equalTo: labelHigh.bottomAnchor,constant: 10),
            labelLow.leadingAnchor.constraint(equalTo: labelHigh.leadingAnchor),
            labelLow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelLow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
    }
}
#Preview{
    CustomGroupTableCell()
}
