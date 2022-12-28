//
//  HomeView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/26.
//

import SwiftUI
import Combine

// 홈뷰에서 보여줄 데이터들 : 모든 코인들의 거래량 증가량, 가격 증가량 -> 5분단위, 1시간단위 만 일단!
struct HomeView: View {
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
        VStack {
            Picker("\(unit)", selection: $unit) {
                Text("5minute")
                    .tag(SelectItem.fiveMinute)
                Text("1hour")
                    .tag(SelectItem.oneHour)
            }
            .pickerStyle(.segmented)
            .onChange(of: unit, perform: { newValue in
                coinVM.coinRanking(unit: unit)
            })
            
            List {
                ForEach(coinVM.coins, id: \.id) { coin in
                    CoinListCellView(coin: coin)
                }
            }.onAppear{
                coinVM.coinRanking(unit: unit)
            }
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(coinVM: CoinVM())
    }
}


extension View {
    /// A backwards compatible wrapper for iOS 14 `onChange`
    @ViewBuilder func valueChanged<T: Equatable>(value: T, onChange: @escaping (T) -> Void) -> some View {
        if #available(iOS 14.0, *) {
            self.onChange(of: value, perform: onChange)
        } else {
            self.onReceive(Just(value)) { (value) in
                onChange(value)
            }
        }
    }
}
