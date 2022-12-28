//
//  ContentView.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/19.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    
    var body: some View {
        VStack {
            TabView(selection: $tabSelection) {
                HomeView().tabItem {
                    Image(systemName: "house.fill")
                }.tag(1)
               
                ProfileView().tabItem {
                    Image(systemName: "person.fill")
                }.tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
