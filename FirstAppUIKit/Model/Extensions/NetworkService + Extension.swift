//
//  NetworkService + Extension.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 19.12.2023.
//

import Foundation
protocol VKNetwork{
    func getFriends(completion: @escaping (Result<[Friend], Error>) -> Void)
    
    func getGroups(completion: @escaping (Result<[Group], Error>) -> Void)
    
    func getPhotos(completion: @escaping ([Photo]) -> Void)
    
    func getUser(completion: @escaping ([User]) -> Void)
    
}

extension NetworkService: VKNetwork{}


