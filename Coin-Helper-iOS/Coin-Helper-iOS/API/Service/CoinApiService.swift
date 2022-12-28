//
//  CoinApiService.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/27.
//

import Foundation
import Alamofire
import Combine

// 코인 관련 api 호출
enum CoinApiService {
    
    static func fetchCoinInfo(unit: Int) -> AnyPublisher<[CoinData], AFError> {
        print("UserApiService - fetchCoinInfo() called")
        let storedTokenData = UserDefaultManager.shared.getTokens()
        
        let credential = OAuthCredential(accessToken: storedTokenData.accessToken, refreshToken: "", expiration: Date(timeIntervalSinceNow: 30000))
        
        // Create the interceptor
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(CoinRouter.coin(unit: unit))
            .publishDecodable(type: [CoinData].self)
            .value()
            .map{ receivedValue in
                return receivedValue
            }.eraseToAnyPublisher()
    }
}

