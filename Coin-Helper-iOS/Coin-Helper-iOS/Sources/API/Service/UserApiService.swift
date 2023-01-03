//
//  UserApiService.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/27.
//

import Foundation
import Alamofire
import Combine

// 사용자 관련 api 호출
// 현재 사용자 정보, 모든 사용자 가져오기
enum UserApiService {
    
    //    // 현재 사용자 정보
    //    static func fetchCurrentUserInfo() -> AnyPublisher<UserData,AFError> {
    //        print("UserApiService - fetchCurrentUserInfo() called")
    //
    //        let storedTokenData = UserDefaultManager.shared.getTokens()
    //
    //        let credential = OAuthCredential(accessToken: storedTokenData.accessToken, refreshToken: storedTokenData.refreshToken, expiration: Date(timeIntervalSinceNow: 30))
    //
    //        // Create the interceptor
    //        let authenticator = OAuthAuthenticator()
    //        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
    //
    //        return ApiClient.shared.session
    //            .request(UserRouter.fetchCurrentUserInfo)
    //            .publishDecodable(type: UserInfoResponse.self)
    //            .value()
    //            .map{ receivedValue in
    //                return receivedValue.user
    //            }.eraseToAnyPublisher()
    //    }
    
    static func fetchTestUserInfo() -> AnyPublisher<TestUserData, AFError> {
        print("UserApiService - fetchCurrentUserInfo() called")
        let storedToken = UserDefaultManager.shared.getTokens()
        let storedTokenData = UserDefaultManager.shared.getTokens()
        
        let credential = OAuthCredential(accessToken: storedTokenData.accessToken, refreshToken: "", expiration: Date(timeIntervalSinceNow: 30000))
        
        // Create the interceptor
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return ApiClient.shared.session
            .request(UserRouter.testFetchUserInfo, interceptor: authInterceptor)
            .publishDecodable(type: TestUserData.self)
            .value()
            .map{ receivedValue in
                return receivedValue
            }.eraseToAnyPublisher()
    }
    
}

