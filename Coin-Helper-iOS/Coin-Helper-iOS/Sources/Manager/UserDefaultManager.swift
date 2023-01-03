//
//  UserDefaultManager.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/27.
//

import Foundation

class UserDefaultManager {
    enum Key: String, CaseIterable {
//        case refreshToken, accessToken
        case accessToken
        case email
    }
    
    static let shared: UserDefaultManager = {
        UserDefaultManager()
    }()
    
    // 저장된 모든 데이터 지우기
    func clearAll() {
        print("UserDefaultsManager - clearAll() called")
        Key.allCases.forEach { UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
    
    // 토큰들 저장
    // userdefaults -> keychain 으로 업데이트예정
    func setTokens(accessToken: String, email: String) {
        print("UserDefaultsManager - setTokens() called")
        UserDefaults.standard.set(accessToken, forKey: Key.accessToken.rawValue)
//        UserDefaults.standard.set(refreshToken, forKey: Key.refreshToken.rawValue)
        UserDefaults.standard.set(email, forKey: Key.email.rawValue)
        UserDefaults.standard.synchronize()
        
    }
    
    // 토큰들 가져오기
    func getTokens() -> TestTokenData {
        let accessToken = UserDefaults.standard.string(forKey: Key.accessToken.rawValue) ?? ""
//        let refreshToken = UserDefaults.standard.string(forKey: Key.refreshToken.rawValue) ?? ""
//        return TokenData(accessToken: accessToken, refreshToken: refreshToken)
        return TestTokenData(accessToken: accessToken)
    }
    
    static func getEmail() -> String {
        let email = UserDefaults.standard.string(forKey: Key.email.rawValue) ?? ""
        return email
    }
}
