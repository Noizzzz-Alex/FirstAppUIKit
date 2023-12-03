//
//  ModelFriend.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation

struct FriendsResponse: Decodable {
    let response: FriendsData
}

struct FriendsData: Decodable {
    let count: Int
    let items: [User]
}

struct User: Decodable {
    
    let firstName: String
    let lastName: String
    let photo100: String

    private enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
}

