//
//  APIService.swift
//  GitUsers
//
//  Created by Naseem Oyebola on 18/05/2022.
//

import Foundation
import Combine
 
class APIService {
    static let shared = APIService()
    func getUsers(perPage: Int = 30, sinceId: Int? = nil) -> AnyPublisher<[User], Error> {
        var components = URLComponents(string: "https://api.github.com/users")!
        components.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: (sinceId != nil) ? "\(sinceId!)" : nil)
        ]
         
        let request = URLRequest(url: components.url!, timeoutInterval: 5)
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}