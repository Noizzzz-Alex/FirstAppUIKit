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
    let name: String
    let photo: String

    enum CodingKeys: String, CodingKey {
        case name
        case photo = "photo_100"
    }
}
