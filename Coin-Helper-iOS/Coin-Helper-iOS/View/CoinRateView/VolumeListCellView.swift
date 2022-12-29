//
//  VolumeListCellView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/28.
//

import SwiftUI

struct VolumeListCellView: View {
    var coin: CoinData
    
    var body: some View {
        HStack {
            VStack {
                Text("\(coin.name)/KRW")
                Text("\(coin.exchange)")
            }
            Spacer()
            HStack {
                Text("\(coin.nowVolume)")
                Text(coin.nowPriceToString)
                    .padding()
                Text(coin.volumeRate + "%")
            }
        }
        .padding()
    }
}

struct VolumeListCellView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeListCellView(coin: CoinData(id: 1, name: "XRP", currency: "upbit", exchange: "upbit", nowPrice: 450.0, beforePrice: 452.0, nowVolume: 54773.90754547, beforeVolume: 1220021.71365228))
    }
}
