//
//  CustomGroupTableCell.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 26.11.2023.
//

import UIKit

class CustomGroupTableCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    private var labelSecond = UILabel()
    private var circle: UIView = {
        let circle = UIView()
        circle.backgroundColor = .systemFill
        circle.layer.cornerRadius = 25
        return circle
    }()

    private let labelFirst: UILabel = {
            let label = UILabel()
            label.text = "Group"
            label.textAlignment = .natural
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 30)
            return label
        }()
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        labelSecond = generateLabel(text: "Description", aligment: .natural, color: .black, fontSize: 20)
        contentView.addSubview(labelSecond)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(circle)
        contentView.addSubview(labelFirst)
        contentView.addSubview(labelSecond)
        setupConstraints()
    }
    private func generateLabel(text: String, aligment: NSTextAlignment, color: UIColor, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = aligment
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }

    private func setupConstraints() {
        circle.translatesAutoresizingMaskIntoConstraints = false
        labelFirst.translatesAutoresizingMaskIntoConstraints = false
        labelSecond.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            circle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            circle.heightAnchor.constraint(equalToConstant: 50),
            circle.widthAnchor.constraint(equalToConstant: 50),
            labelFirst.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            labelFirst.leadingAnchor.constraint(equalTo: circle.trailingAnchor, constant: 30),
            labelFirst.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            labelSecond.topAnchor.constraint(equalTo: labelFirst.bottomAnchor, constant: 10),
            labelSecond.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelSecond.leadingAnchor.constraint(equalTo: labelFirst.leadingAnchor),
            labelSecond.trailingAnchor.constraint(equalTo: labelFirst.trailingAnchor)
            

        ])
    }
}
