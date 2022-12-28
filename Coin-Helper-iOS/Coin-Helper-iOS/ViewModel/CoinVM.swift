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
    
    // 코인 Fetch 완료 이벤트
    var fetchCoinSuccess = PassthroughSubject<(), Never>()
    
    /// 회원가입하기
    func coinRanking(unit: Int) {
        print("CoinVM: register() called")
        
        CoinApiService.fetchCoinInfo(unit: unit)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (coins: [CoinData]) in
                self.coins = coins
                self.fetchCoinSuccess.send()
            }.store(in: &subscription)
    }
    
}


