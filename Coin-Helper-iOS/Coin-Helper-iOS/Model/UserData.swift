//
//  UserData.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/22.
//

import Foundation

// 서버에서 넘어온 유저 데이터 Model
struct UserData: Codable, Identifiable {
    var uuid: UUID = UUID()
    var id: Int
    var name: String
    var email: String
    var avatar: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case avatar
    }
}
