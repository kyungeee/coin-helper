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
    
    static func fetchVolumeRanking(unit: Int) -> AnyPublisher<[CoinData], AFError> {
        print("UserApiService - fetchVolumeRanking() called")

        return ApiClient.shared.session
            .request(CoinRouter.volume(unit: unit))
            .publishDecodable(type: [CoinData].self)
            .value()
            .map{ receivedValue in
                return receivedValue
            }.eraseToAnyPublisher()
    }
    
    static func fetchPriceRanking(unit: Int) -> AnyPublisher<[CoinData], AFError> {
        print("UserApiService - fetchPriceRanking() called")
        
        return ApiClient.shared.session
            .request(CoinRouter.price(unit: unit))
            .publishDecodable(type: [CoinData].self)
            .value()
            .map{ receivedValue in
                return receivedValue
            }.eraseToAnyPublisher()
    }
    
    
}

