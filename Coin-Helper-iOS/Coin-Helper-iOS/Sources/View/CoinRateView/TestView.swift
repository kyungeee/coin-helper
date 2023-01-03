//
//  TestView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2023/01/03.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        HStack {
            VStack {
                Text("24h Volume")
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                Text("$500,73M")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
            }.padding()
            
            VStack {
                Text("Open Interest")
                    .font(.system(size: 13))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                Text("$323,22M")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
            }.padding()
            
            VStack {
                Text("Trades")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                Text("115,279")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
            }.padding()
        } //hstack
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
