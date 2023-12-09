//
//  UserModel.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 09.12.2023.
//

import Foundation

struct UserModel: Decodable {
    let response: [User]
}

struct User: Decodable {
    let firstName: String
    let lastName: String
    let photo: String
    let id: UInt
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_400_orig"
    }
}
