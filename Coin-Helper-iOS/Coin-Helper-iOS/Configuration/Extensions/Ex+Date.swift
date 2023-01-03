//
//  Ex+Date.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2023/01/03.
//

import Foundation

extension Date {
    func getFormattedDate() -> String {
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "ko_KR")
        dateformat.timeZone = TimeZone(abbreviation: "KST")
        dateformat.dateFormat = "a h:mm"
        dateformat.amSymbol = "오전"
        dateformat.pmSymbol = "오후"
        return dateformat.string(from: self)
    }
}

