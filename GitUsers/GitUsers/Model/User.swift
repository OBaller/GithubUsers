//
//  User.swift
//  GitUsers
//
//  Created by Naseem Oyebola on 18/05/2022.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let avatarUrl: String
    let type: String
     
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
        case type
    }
}
