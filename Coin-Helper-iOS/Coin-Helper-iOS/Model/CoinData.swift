//
//  CoinData.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/27.
//

import Foundation


// Coin Data Model
struct CoinData: Codable, Identifiable {
    var id: Int
    var name: String
    var currency: String // 화폐단위
    var exchange: String // 거래소
    var nowPrice: Double // 현재가격
    var beforePrice: Double // 전 가격
    var nowVolume: Double // 현재거래량
    var beforeVolume: Double // 전 거래량
   
}

