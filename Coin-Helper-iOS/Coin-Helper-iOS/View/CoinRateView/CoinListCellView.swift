//
//  CoinListCellView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/27.
//

import SwiftUI
import Foundation

// Coin Data Model
//struct CoinData: Codable, Identifiable {
//    var id: Int
//    var name: String
//    var currency: String // 화폐단위
//    var exchange: String // 거래소
//    var nowPrice: Double // 현재가격
//    var beforePrice: Double // 전 가격
//    var nowVolume: Double // 현재거래량
//    var beforeVolume: Double // 전 거래량
//
//}


struct CoinListCellView: View {
    var coin: CoinData
    
    var body: some View {
        HStack {
            VStack {
                Text("\(coin.name)/KRW")
                Text("\(coin.exchange)")
            }
            Spacer()
            Text(coin.nowPriceToString)
                .padding()
            Text(coin.priceRate + "%")
        }
        .padding()
    }
}

struct CoinListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListCellView(coin: CoinData(id: 1, name: "XRP", currency: "upbit", exchange: "upbit", nowPrice: 450.0, beforePrice: 452.0, nowVolume: 54773.90754547, beforeVolume: 1220021.71365228))
    }
}
