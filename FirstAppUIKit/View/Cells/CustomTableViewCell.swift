//
//  CustomTableViewCell.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 25.11.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell, BackgroundColor {
    
    func changeBackgroundColor() {
        switch CurrentTheme.currentTheme{
            
        case .light:
            contentView.backgroundColor = UIColor.white
            labelHigh.textColor = UIColor.black
            labelMiddle.textColor = UIColor.black
            labelLow.textColor = UIColor.black
            borderLabel.layer.borderColor = UIColor.black.cgColor
        case .dark:
            contentView.backgroundColor = UIColor.black
            labelHigh.textColor = UIColor.white
            labelMiddle.textColor = UIColor.white
            labelLow.textColor = UIColor.white
            borderLabel.layer.borderColor = UIColor.white.cgColor
        case .gray:
            contentView.backgroundColor = UIColor.gray
            labelHigh.textColor = UIColor.yellow
            labelMiddle.textColor = UIColor.yellow
            labelLow.textColor = UIColor.yellow
            borderLabel.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    var tap: ((String, String, UIImage?) -> Void)?
    
    static let identifier = "Cell"

    private var userPhoto: UIImageView = {
        var photo = UIImageView()
        photo.image = UIImage(named: "person")
        photo.layer.cornerRadius = 25
        photo.clipsToBounds = true
        photo.backgroundColor = .clear
        photo.contentMode = .scaleAspectFit
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()

    private var onlineFlag: UIView = {
        let circle = UIView()
        circle.backgroundColor = UIColor.clear
        circle.layer.cornerRadius = 5
        circle.clipsToBounds = true
        circle.translatesAutoresizingMaskIntoConstraints = false
        return circle
    }()
    
    var labelHigh: UILabel = {
       let label = UILabel()
        label.text = "First Name"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelMiddle : UILabel = {
        let label = UILabel()
         label.text = "Last Name"
         label.font = UIFont.systemFont(ofSize: 25)
         label.textAlignment = .natural
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    var labelLow : UILabel = {
        let label = UILabel()
         label.text = "unknown"
         label.font = UIFont.systemFont(ofSize: 25)
         label.textAlignment = .natural
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    let borderLabel: UILabel = {
        let label = UILabel()
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        registerRecognizer()
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerRecognizer(){
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recognizer)
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
    
    @objc func cellTap(){
        tap?(labelHigh.text ?? "John",labelMiddle.text ?? "Dow" ,userPhoto.image ?? UIImage(named: "person"))
    }
}

#Preview() {
    CustomTableViewCell()
}
