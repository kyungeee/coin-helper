//
//  CoinListCellView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2023/01/03.
//

import SwiftUI
import URLImage

struct CoinListCellView: View {
    var coin: CoinData
    
    var body: some View {
        HStack {
            HStack {
                URLImage(URL(string: "https://static.upbit.com/logos/\(coin.name).png")!) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                }
                VStack(alignment: .leading) {
                    Text("\(coin.name)/KRW")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text("\(coin.exchange)")
                        .font(.callout)
                        .fontWeight(.medium)
                }
                Spacer()
            }
            
            VStack(alignment: .trailing) {
                HStack {
                    Text(coin.roundedNowVolume)
                        .padding(.trailing, 20)
                    Spacer()
                    Text(coin.priceRate + "%")
                        .font(.callout)
                        .fontWeight(.medium)
                }
                Text(coin.nowPriceToString)
                    .font(.callout)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct CoinListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListCellView(coin: CoinData(id: 1, name: "XRP", currency: "upbit", exchange: "upbit", nowPrice: 450.0, beforePrice: 452.0, nowVolume: 54773.90754547, beforeVolume: 1220021.71365228))
    }
}
