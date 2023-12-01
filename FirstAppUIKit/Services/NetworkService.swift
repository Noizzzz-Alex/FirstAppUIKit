//
//  NetworkService.swift
//  FirstAppUIKit
//
//  Created by Александр Харлампов on 01.12.2023.
//

import Foundation
final class NetworkService {
    private let session = URLSession.shared
    
    func getFriends() {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?access_token=5c0766e85c0766e85c0766e8655f111a2a55c075c0766e8396e493fd353e26591cbe190&user_id=833545445&order=name&fields=photo_100&v=5.199") else {
            return
        }
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(FriendsResponse.self, from: data)
                let friends = response.response.items
                print(friends)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getCatError(errorCode: Int) {
        //        guard let url = URL(string: "https://http.cat/\(errorCode)") else { return }
        //
        //        session.dataTask(with: url) { data, _, _ in // здесь не нужны респонс и еррор, поэтому вместо них нижнее подчеркивание
        //            print(data ?? "Error receiving data")
        //        }
        //        .resume()
    }
    
    func getActualNews() {
        //        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?lang=&fields=publication_date,title,body_text&text_format=text&actual_only=true") else {
        //            return
        //        }
        //        session.dataTask(with: url) { data, _, error in
        //            guard let data else { return } // проверяем что пришли хоть какие то данные
        //
        //            do {
        //                let cities = try JSONDecoder().decode(NewsResults.self, from: data)
        //                print(cities)
        //            } catch {
        //                print(error) // здесь будет выводится ошибки декодирования а не те ошибки что придут из сети
        //            }
        //        }.resume()
    }
    
    func getPlaces() {
        //        guard let url = URL(string: "https://kudago.com/public-api/v1.2/places/") else {
        //            return
        //        }
        //        session.dataTask(with: url) { data, _, error in
        //            guard let data else { return } // проверяем что пришли хоть какие то данные
        //
        //            do {
        //                let cities = try JSONDecoder().decode(placesResults.self, from: data)
        //                print(cities)
        //            } catch {
        //                print(error) // здесь будет выводится ошибки декодирования а не те ошибки что придут из сети
        //            }
        //        }.resume()
    }
    func getMovies() {
        //        guard let url = URL(string: "https://kudago.com/public-api/v1.4/movies/?lang=&fields=title,site_url,body_text,country,year,imdb_rating") else {
        //            return
        //        }
        //        session.dataTask(with: url) { data, _, error in
        //            guard let data else { return } // проверяем что пришли хоть какие то данные
        //
        //            do {
        //                let cities = try JSONDecoder().decode(MoviesResults.self, from: data)
        //                print(cities)
        //            } catch {
        //                print(error) // здесь будет выводится ошибки декодирования а не те ошибки что придут из сети
        //            }
        //        }.resume()
    }
}
