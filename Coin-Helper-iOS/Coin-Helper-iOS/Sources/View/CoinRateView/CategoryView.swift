//
//  CategoryView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/29.
//

import SwiftUI

struct CategoryView: View {
    @Binding var selectedRanking: String
    @Binding var selectedExchange: String
    @Binding var selectedCurrency: String
    
    var exchanges: [String] = ["빗썸 (Bithumb)", "업비트 (Upbit)", "바이낸스 (Binance)", "바이비트 (ByBit)", "바이비트 (Bybit) 현물", "비트맥스 (Bitmex)", "비트 파이넥스 (Bitfinex)", "코인베이스 (Coinbase)", "코인원 (Coinone)", "코빗 (Korbit)", "고팍스 (GOPAX)", "후오비 (Huobi)", "OKX" ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack (alignment: .leading) {
                
                Text("Hello, Tenser! 👋🏻")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Text("I'm your coper")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 6)
            }.padding([.leading, .top], 15)
                .padding(.bottom, 30)
//            HStack {
//                // standard of ranking
//                Menu {
//                    Button {
//                        selectedRanking = "거래 증가량순"
//                    } label: {
//                        Text("거래 증가량순")
//                    }
//
//                    Button {
//                        selectedRanking = "가격 증가량순"
//                    } label: {
//                        Text("가격 증가량순")
//                    }
//
//                } label: {
//                    Text("\(selectedRanking)")
//                        .font(.body)
//                        .fontWeight(.medium)
//                        .foregroundColor(.white)
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.white)
//                        .font(.caption)
//                        .fontWeight(.medium)
//                        .padding(.leading, -4)
//                }.pickerStyle(.menu)
//
//                Spacer()
//
//                Menu {
//                    ForEach(0..<exchanges.count) { index in
//                        Button {
//                            selectedExchange = exchanges[index]
//                        } label: {
//                            Text("\(exchanges[index])")
//                        }
//                    }
//                } label: {
//                    Text("\(selectedExchange)")
//                        .font(.body)
//                        .fontWeight(.medium)
//                        .foregroundColor(.white)
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.white)
//                        .font(.caption)
//                        .fontWeight(.medium)
//                        .padding(.leading, -4)
//                }.padding(.trailing, 5)
//
//                Menu {
//                    Button {
//                        selectedCurrency = "KRW"
//                    } label: {
//                        Text("KRW")
//                    }
//
//                    Button {
//                        selectedCurrency = "BTC"
//                    } label: {
//                        Text("BTC")
//                    }
//
//                } label: {
//                    Text("\(selectedCurrency)")
//                        .font(.body)
//                        .fontWeight(.medium)
//                        .foregroundColor(.white)
//                    Image(systemName: "chevron.down")
//                        .foregroundColor(.white)
//                        .font(.caption)
//                        .fontWeight(.medium)
//                        .padding(.leading, -4)
//                }
                
//            }.padding([.bottom,.leading, .trailing])
        }.background(Color.cyan)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(selectedRanking: .constant("거래 증가량순"), selectedExchange: .constant("업비트 (Upbit)"), selectedCurrency: .constant("KRW"))
    }
}
