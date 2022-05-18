//
//  APIService.swift
//  GitUsers
//
//  Created by Naseem Oyebola on 18/05/2022.
//

import Foundation
import Combine
import SwiftUI

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
    
    
    func search(with: [String: String], completion: @escaping(Result<[User], APIError>) -> Void) {
        guard let url = NSURLComponents(string: "https://api.github.com/search/users") else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        var item = [URLQueryItem]()
        for (key, value) in with {
            item.append(URLQueryItem(name: key, value: value))
        }
        
        item = item.filter{!$0.name.isEmpty}
        
        if !item.isEmpty {
            url.queryItems = item
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url.url!)) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let users = try decoder.decode(UserModel.self, from: data)
                    completion(Result.success(users.items))
                    
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
        
    }
}
