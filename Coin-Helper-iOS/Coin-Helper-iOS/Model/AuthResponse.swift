//
//  AuthResponse.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/25.
//

import Foundation

struct AuthResponse: Codable {
    var user: UserData
    var token: TokenData
    
    enum CodingKeys: String, CodingKey {
        case token
        case user
    }
}
