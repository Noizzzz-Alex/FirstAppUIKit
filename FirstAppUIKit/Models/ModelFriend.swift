//
//  ModelFriend.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation

struct FriendsResponse: Codable {
    let response: FriendsData
}

struct FriendsData: Codable {
    let count: Int
    let items: [User]
}

struct User: Codable {
    let id: Int
    let trackCode: String
    let photo100: String
    let firstName: String
    let lastName: String
    let canAccessClosed: Bool
    let isClosed: Bool

    private enum CodingKeys: String, CodingKey {
        case id
        case trackCode = "track_code"
        case photo100 = "photo_100"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
    }
}
