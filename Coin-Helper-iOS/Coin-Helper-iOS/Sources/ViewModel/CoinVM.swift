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
    var fetchVolumeRankingSuccess = PassthroughSubject<(), Never>()
    var fetchPriceRankingSuccess = PassthroughSubject<(), Never>()
    
    // 거래량 증가률 순위 가져오기
    func fetchVolumeRanking(unit: Int) {
        print("CoinVM: register() called")
        
        CoinApiService.fetchVolumeRanking(unit: unit)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (coins: [CoinData]) in
                self.coins = coins
                self.fetchVolumeRankingSuccess.send()
            }.store(in: &subscription)
    }
    
    // 코인 가격 증가률 순위 가져오기
    func fetchPriceRanking(unit: Int) {
        print("CoinVM: register() called")
        
        CoinApiService.fetchPriceRanking(unit: unit)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (coins: [CoinData]) in
                self.coins = coins
                self.fetchPriceRankingSuccess.send()
            }.store(in: &subscription)
    }
}


