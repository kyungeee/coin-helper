//
//  CoinVM.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/27.
//

import Foundation
import Alamofire
import Combine

class CoinVM: ObservableObject {
    
    //MARK: propertis
    var subscription = Set<AnyCancellable>()
    
    @Published var coins: [CoinData] = []
    
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
    
}
