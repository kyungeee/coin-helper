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
    
    // enum type 적용 [x]
    @State var selectedRanking: String = "거래 증가량순"
    @State var selectedExchange: String = "업비트 (Upbit)"
    @State var selectedCurrency: String = "KRW"
    
    var body: some View {
            VStack {
                CategoryView(selectedRanking: $selectedRanking, selectedExchange: $selectedExchange ,selectedCurrency: $selectedCurrency)
                Spacer()
                if selectedRanking == "거래 증가량순" {
                    VolumeListView()
                } else {
                    PriceListView()
                }
                
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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


struct MyPicker : View {

@Namespace var namespace

@Binding var values : [String]
@Binding var selected : String
@Binding var isExpanded : Bool

var body: some View {
    if isExpanded {
        List(values, id: \.self) { value in

            Text("\(value)")
                .foregroundColor(Color.black)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        selected = value
                        isExpanded.toggle()
                    }
                }

                .listRowBackground(selected == value ? Color.green.opacity(0.3) : Color.white)


        }.matchedGeometryEffect(id: "menu", in: namespace)
    } else {
        Text("\(selected != "" ? selected : values.first!)").padding()
            .frame(maxWidth: .infinity, alignment: .leading)

            .background(Rectangle().foregroundColor(.green.opacity(0.3)).cornerRadius(5))
            .matchedGeometryEffect(id: "menu", in: namespace)
            .foregroundColor(Color.black)
            .padding()

    }

}
}
