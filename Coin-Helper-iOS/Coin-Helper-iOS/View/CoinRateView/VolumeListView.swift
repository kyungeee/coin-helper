//
//  VolumeListView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/28.
//

import SwiftUI

struct VolumeListView: View {
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
//                coinVM.coinRanking(unit: unit)
                print("1시간 데이터 가져오기 ")
            })
            
            List {
                Section(header: Text("")) {
                    ForEach(coinVM.coins, id: \.id) { coin in
                        VolumeListCellView(coin: coin)
                    }
                }
            }
            .listStyle(.inset)
            .onAppear{
                coinVM.fetchVolumeRanking(unit: unit)
            }
            
        }
    }
}

struct VolumeListView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeListView()
    }
}
