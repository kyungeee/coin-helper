//
//  TitleView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2023/01/03.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("Hello, Tenser! 👋🏻")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                HStack(alignment: .bottom) {
                    Text("I'm your coper")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 6)
                    
                    Spacer()
                    
                    Button {
                        // 검색 구현
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.regular)
                    .padding([.bottom], 4)
                    .padding(.trailing, -8)

                }
            }.padding(.bottom, 40)
            Spacer()
        }
        .padding()
        .background(Color.accentColor)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
