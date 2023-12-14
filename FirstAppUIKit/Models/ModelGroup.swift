//
//  ModelGroup.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation


struct ModelGroup: Decodable {
    let response: GroupData
}

struct GroupData: Decodable {
    let items: [Group]
}

struct Group: Decodable {
    let id: Int
    let name: String
    let description: String
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case photo = "photo_50"
    }
}
