//
//  CustomTableViewCell.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "Cell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private var userPhoto = UIImageView()
    private var onlineFlag = CircleViews.createCircleUIView(color: .blue, radius: 0)
    private var labelHigh = Labels.createLabel(text: "Text_1", fontSize: 25, textAlignment: .natural, textColor: .black, userBorderColor: .white, borderWidth: 0, cornerRadius: 0)
    private var labelMiddle = Labels.createLabel(text: "Text_2", fontSize: 25, textAlignment: .natural, textColor: .black, userBorderColor: .black, borderWidth: 0, cornerRadius: 0)
    private var labelLow = Labels.createLabel(text: "Text_3", fontSize: 25, textAlignment: .natural, textColor: .black, userBorderColor: .white, borderWidth: 0, cornerRadius: 0)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(friends: Friend) {
        labelHigh.text = friends.firstName
        labelMiddle.text = friends.lastName
        labelLow.text = friends.online > 0 ? "Online" : "Offline"
        onlineFlag.backgroundColor = friends.online > 0 ? .green : .red
        DispatchQueue.global().async {
            if let url = URL(string: friends.photo),
               let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.userPhoto.image = UIImage(data: data)
                }
            }
        }
    }

    private func setupViews() {
        contentView.addSubview(userPhoto)
        contentView.addSubview(onlineFlag)
        contentView.addSubview(labelHigh)
        contentView.addSubview(labelMiddle)
        contentView.addSubview(labelLow)
        setupConstraintsCell()
    }

    private func setupConstraintsCell() {
        userPhoto.translatesAutoresizingMaskIntoConstraints = false
        onlineFlag.translatesAutoresizingMaskIntoConstraints = false
        labelHigh.translatesAutoresizingMaskIntoConstraints = false
        labelMiddle.translatesAutoresizingMaskIntoConstraints = false
        labelLow.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // MARK: USER PHOTO

            userPhoto.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userPhoto.heightAnchor.constraint(equalToConstant: 50),
            userPhoto.widthAnchor.constraint(equalToConstant: 50),

            // MARK: ONLINE FLAG

            onlineFlag.topAnchor.constraint(equalTo: labelMiddle.bottomAnchor, constant: 13),
            onlineFlag.trailingAnchor.constraint(equalTo: labelMiddle.leadingAnchor, constant: 15),
            onlineFlag.heightAnchor.constraint(equalToConstant: 10),
            onlineFlag.widthAnchor.constraint(equalToConstant: 10),

            // MARK: LABEL HIGH

            labelHigh.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelHigh.leadingAnchor.constraint(equalTo: userPhoto.trailingAnchor, constant: 30),
            labelHigh.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),

            // MARK: LABEL MIDDLE

            labelMiddle.topAnchor.constraint(equalTo: labelHigh.bottomAnchor, constant: 5),
            labelMiddle.leadingAnchor.constraint(equalTo: labelHigh.leadingAnchor),
            labelMiddle.trailingAnchor.constraint(equalTo: labelHigh.trailingAnchor),

            // MARK: LABEL LOW

            labelLow.topAnchor.constraint(equalTo: labelMiddle.bottomAnchor, constant: 5),
            labelLow.leadingAnchor.constraint(equalTo: onlineFlag.trailingAnchor, constant: 10),
            labelLow.trailingAnchor.constraint(equalTo: labelMiddle.trailingAnchor),
            labelLow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }
}

 #Preview(){
    CustomTableViewCell()
 }
