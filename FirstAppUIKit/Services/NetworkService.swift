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
    
    //VkApps скрыт от Гит
    static let request = "https://oauth.vk.com/authorize?client_id=51805697&scope=notify,photos,friends,audio,video,notes,pages,docs,status,questions,offers,wall,groups,messages,notifications,stats,ads,offline&redirect_uri=http://api.vk.com/blank.html&display=mobile&response_type=token"
    
    
    func getFriends() {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=\(VkApps.AccessToken.token)&user_id=833545445&order=name&fields=photo_100&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(FriendsResponse.self, from: data)
                let answer = response.response.items
                print(answer)
                print("Токен: \(NetworkService.token)")
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    func getGroups() {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(VkApps.AccessToken.token)&user_id=833545445&extended=1&order=screen_name&fields=photo_100&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(GroupResponse.self, from: data)
                let answer = response.response.items
                print(answer)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPhotos() {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(VkApps.AccessToken.token)&owner_id=833545445&album_id=profile&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
    
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PhotoModel.self, from: data)
                let answer = response.response.items
                print(answer!)
            } catch {
                print(error)
            }
        }.resume()
        
    }

}
