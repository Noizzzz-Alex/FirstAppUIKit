//
//  PhotoModel.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 02.12.2023.
//

import Foundation

struct PhotoModel: Decodable {
    var response: Photos
}

struct Photos: Decodable {
    var items: [Photo]?
}

struct Photo: Decodable {
    var id: Int
    var text: String
    var sizes: [Size]
}

struct Size: Codable {
    var url: String
}
