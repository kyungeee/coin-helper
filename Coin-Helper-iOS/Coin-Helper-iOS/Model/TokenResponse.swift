//
//  TokenResponse.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/27.
//

import Foundation

// MARK: - Welcome
struct TokenResponse: Codable {
    let message: String
    let token: TokenData
}
