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
    static var userId = ""
    static var anotherUserId = ""
    private let session = URLSession.shared

    static var request = "https://oauth.vk.com/authorize?client_id=51805697&scope=notify,photos,friends,audio,video,notes,pages,docs,status,questions,offers,wall,groups,messages,notifications,stats,ads,offline&redirect_uri=http://api.vk.com/blank.html&display=mobile&response_type=token"

    func getFriends(completion: @escaping (Result<[Friend], Error>) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=\(NetworkService.token)&fields=photo_50,online&v=5.199&count=5") else { return }

        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(Error.self as! Error))
                return
            }
            if let error = error{
                completion(.failure(error))
            }
            do {
                let friends = try JSONDecoder().decode(ModelFriend.self, from: data)
                completion(.success(friends.response.items))
            } catch { 
                completion(.failure(error)) }
        }.resume()
    }

    func getGroups(completion: @escaping (Result<[Group], Error>) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkService.token)&fields=description&v=5.199&extended=1&count=5") else { return }

        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(Error.self as! Error))
                return
            }
            if let error = error{
                completion(.failure(error))
            }
            do {
                let groups = try JSONDecoder().decode(ModelGroup.self, from: data)
                completion(.success(groups.response.items))
            } catch {
                completion(.failure(error)) }
        }.resume()
    }

    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?access_token=\(NetworkService.token)&v=5.199&&album_id=profile&count=5") else { return }

        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let photos = try JSONDecoder().decode(PhotoModel.self, from: data).response.items
                completion(photos ?? [])
            } catch { print(error) }
        }.resume()
    }

    func getUser(completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/users.get?access_token=\(NetworkService.token)&user_ids=\(NetworkService.userId)&fields=photo_400_orig&v=5.199&count=5") else { return }

        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode(UserModel.self, from: data).response
                completion(users)
            } catch { print(error) }
        }.resume()
    }
    func getAnotherUser(completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/users.get?access_token=\(NetworkService.token)&user_ids=\(NetworkService.anotherUserId)&fields=photo_400_orig&v=5.199&count=5") else { return }

        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode(UserModel.self, from: data).response
                completion(users)
            } catch { print(error) }
        }.resume()
    }
}
