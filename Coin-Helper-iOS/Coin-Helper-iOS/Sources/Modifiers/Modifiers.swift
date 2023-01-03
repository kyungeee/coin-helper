//
//  Modifiers.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2023/01/03.
//

import Foundation
import SwiftUI

// MARK: 배경색이 들어간 버튼에 사용될 모디파이어. 버튼 크기에 따라 cornerRadius를 5, 10 으로 구분지어 사용하면 된다/
struct ColoredButtonModifier: ViewModifier {
    var color: Color = Color("AccentColor")
    var fontColor: Color = Color("white")
    var cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .foregroundColor(fontColor)
            .padding(10)
            .bold()
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .padding(.horizontal)
    }
}

//frame 설정은 외부에서 별도로 설정 해주면 됨
