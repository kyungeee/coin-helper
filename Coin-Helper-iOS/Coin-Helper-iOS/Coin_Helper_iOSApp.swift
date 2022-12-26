//
//  Coin_Helper_iOSApp.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/19.
//

import SwiftUI

@main
struct Coin_Helper_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserVM())
        }
    }
}
