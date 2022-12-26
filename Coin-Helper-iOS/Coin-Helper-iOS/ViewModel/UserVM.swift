//
//  UserVM.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/27.
//

import Foundation
import Alamofire
import Combine

class UserVM: ObservableObject {
    
    //MARK: propertis
    var subscription = Set<AnyCancellable>()
    
//    @Published var loggedInUser: UserData? = nil
    @Published var email: TestUserData? = nil
    
    
    // 회원가입 완료 이벤트
    var registrationSuccess = PassthroughSubject<(), Never>()
    
    // 로그인 완료 이벤트
    var loginSuccess = PassthroughSubject<(), Never>()
    
    // 이메일 유효 이벤트
    var emailSuccess = PassthroughSubject<(), Never>()
    
    /// 회원가입하기
    func register(name: String, email: String, password: String) {
        print("UserVM: register() called")
        
        AuthApiService.register(name: name, email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: LoginResponseData) in
//                self.loggedInUser = receivedUser
                self.registrationSuccess.send()
            }.store(in: &subscription)
    }
    
    /// 로그인하기
    func login(email: String, password: String) {
        print("UserVM: register() called")
        
        AuthApiService.login(email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: IsLogined) in
//                self.loggedInUser = receivedUser
                UserDefaultManager.shared.setTokens(accessToken: receivedUser.token, email: email)
                self.loginSuccess.send()
            }.store(in: &subscription)
    }
    
    // 현재 사용자 정보 가져오기
    func fetchCurrentUserInfo() {
        print("UserVM - fetchCurrentUserInfo() called")
        UserApiService.fetchTestUserInfo()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: TestUserData) in
//                self.loggedInUser = receivedUser
                self.email = receivedUser
            }.store(in: &subscription)
    }
    
    // 이메일 체크
    func emailCheck(email: String) {
        print("UserVM: register() called")
        AuthApiService.emailCheck(email: email)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: EmailCheckResponse) in
//                self.loggedInUser = receivedUser
                self.emailSuccess.send()
            }.store(in: &subscription)
    }
}
