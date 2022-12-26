//
//  AuthApiService.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/25.
//

import Foundation
import Alamofire
import Combine


// 인증 관련 api 호출
enum AuthApiService {
    
    // 회원가입
    static func register(name: String, email: String, password: String) -> AnyPublisher<LoginResponseData, AFError> {
        print("AuthApiService - register() called")
        
        // 데이터 가공 블라블라 는 다 요기서
        return ApiClient.shared.session
            .request(AuthRouter.register(name: name, email: email, password: password))
            .publishDecodable(type: LoginResponseData.self)
            .value()
            .map{ receivedValue in
                // 받은 토큰 정보 어딘가에 영구 저장
                // userdefaults, keychain
//                UserDefaultManager.shared.setTokens(accessToken: receivedValue.token.accessToken, refreshToken: receivedValue.token.refreshToken)
//                return receivedValue.user
                print("userid: \(receivedValue.id)")
                
                return receivedValue
            }.eraseToAnyPublisher()
    }
    
    // 로그인 
    static func login(email: String, password: String) -> AnyPublisher<IsLogined, AFError> {
        let email = email
        print("AuthApiService - register() called")
        
        // 데이터 가공 블라블라 는 다 요기서
        return ApiClient.shared.session
            .request(AuthRouter.login(email: email, password: password))
            .publishDecodable(type: IsLogined.self)
            .value()
            .map{ receivedValue in
//                UserDefaultManager.shared.setTokens(accessToken: receivedValue.token.accessToken, email: email)
                print("message: \(receivedValue.message)")
                print("token: \(receivedValue.token)")
                return receivedValue
            }.eraseToAnyPublisher()
    }
    
    // 이메일 중복 체크
    static func emailCheck(email: String) -> AnyPublisher<EmailCheckResponse, AFError> {
        let email = email
        print("AuthApiService - register() called")
        
        // 데이터 가공 블라블라 는 다 요기서
        return ApiClient.shared.session
            .request(idCheckRouter.idcheck(email: email))
            .publishDecodable(type: EmailCheckResponse.self)
            .value()
            .map{ receivedValue in
//                UserDefaultManager.shared.setTokens(accessToken: receivedValue.token.accessToken, email: email)
                if receivedValue.message == "OK" {
                    print("사용 가능한 이메일 입니다. ")
                } else {
                    print("\(receivedValue.message)")
                    print("사용 불가능한 이메일 입니다. ")
                }
                return receivedValue
            }.eraseToAnyPublisher()
    }
    
    
}
