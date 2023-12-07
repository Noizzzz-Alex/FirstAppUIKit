//
//  NetworkService.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation
import UIKit
final class NetworkService {
    static var token = ""
    private let session = URLSession.shared
    
    // VkApps скрыт от Гит
    static var request = "https://oauth.vk.com/authorize?client_id=51805697&scope=notify,photos,friends,audio,video,notes,pages,docs,status,questions,offers,wall,groups,messages,notifications,stats,ads,offline&redirect_uri=http://api.vk.com/blank.html&display=mobile&response_type=token"
    
    func getFriends(completion: @escaping ([Friend]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=\(NetworkService.token)&fields=photo_50,online&v=5.199&count=5") else { return }
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let friends = try JSONDecoder().decode(ModelFriend.self, from: data).response.items
                completion(friends)
            } catch { print(error) }
        }.resume()
    }
    
    
    func getGroups(completion: @escaping ([Group]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkService.token)&fields=description&v=5.199&extended=1&count=5") else { return }
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let groups = try JSONDecoder().decode(ModelGroup.self, from: data).response.items
                completion(groups)
            } catch { print(error) }
        }.resume()
    }
    
    // func getPhotos(completion: @escaping ([Photo]) -> Void) {
    //        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(NetworkService.token)&v=5.199&&album_id=profile&count=10") else { return }
    //
    //        session.dataTask(with: url) { (data, _, error) in
    //            guard let data = data else { return }
    //            do {
    //                let photos = try JSONDecoder().decode(PhotosModel.self, from: data).response.items
    //                completion(photos ?? [])
    //            } catch { print(error) }
    //        }.resume()
    //    }
}
