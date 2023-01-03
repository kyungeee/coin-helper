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
        VStack(alignment: .leading) {
            ZStack{
                TitleView()
                TestView()
                    .offset(y: 60)
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text("가격 증가량 순")
                        .fontWeight(.bold)
                }.modifier(ColoredButtonModifier(color: Color.accentColor, fontColor: .white, cornerRadius: 20))
                
                Spacer()
                Button {
                    
                } label: {
                    Text("KRW")
                        .fontWeight(.bold)
                }.modifier(ColoredButtonModifier(color: Color.white, fontColor: .black, cornerRadius: 20))
                
                Button {
                    
                } label: {
                    Text("거래소 선택")
                        .fontWeight(.bold)
                }.modifier(ColoredButtonModifier(color: Color.white , fontColor: .black, cornerRadius: 20))
                
                Button {
                    
                } label: {
                    Text("5m")
                        .fontWeight(.bold)
                }.modifier(ColoredButtonModifier(color: Color.white , fontColor: .black, cornerRadius: 20))

            }.padding(.top, 34)
                .padding(.bottom, 20)
            
            PriceListView()
//                .padding(.top, 80)
            
        }
        .background(Color("BackgroundColor"))
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

