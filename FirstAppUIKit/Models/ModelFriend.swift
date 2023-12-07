//
//  ModelFriend.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation

struct ModelFriend: Decodable {
    let response: FriendsData
}

struct FriendsData: Decodable {
    let count: Int
    let items: [Friend]
}

struct Friend: Decodable {
    
    let firstName: String
    let lastName: String
    let photo: String
    let online: Int

    private enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
    }
}

