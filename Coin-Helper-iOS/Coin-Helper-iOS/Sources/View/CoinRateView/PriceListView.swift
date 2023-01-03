//
//  PriceListView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/28.
//

import SwiftUI

struct PriceListView: View {
    
    @StateObject var coinVM: CoinVM = CoinVM()
    @State private var unit: Int = 5
    
    enum SelectItem: String, CaseIterable {
        case fiveMinute
        case oneHour
        var id: Self { self }
    }
    
    @State private var fiveMinute: SelectItem = .fiveMinute
    @State private var oneHour: SelectItem = .oneHour
    
    var body: some View {
        VStack{
            ScrollView {
                VStack {
                    ForEach(coinVM.coins, id: \.id) { coin in
                        PriceListCellView(coin: coin)
                            .padding([.leading, .trailing],10)
                            .padding([.top, .bottom], 2)
                        
                    }
                }
            }
            .onAppear {
                coinVM.fetchPriceRanking(unit: unit)
            }
            .background(Color("BackgroundColor"))
        }
    }
}

struct PriceListView_Previews: PreviewProvider {
    static var previews: some View {
        PriceListView()
    }
}
