//
//  CoinData.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/27.
//

import Foundation


// Coin Data Model
struct CoinData: Codable, Identifiable {
    var id: Int
    var name: String
    var currency: String // 화폐단위
    var exchange: String // 거래소
    var nowPrice: Double // 현재가격
    var beforePrice: Double // 전 가격
    var nowVolume: Double // 현재거래량
    var beforeVolume: Double // 전 거래량
    
    var nowVolumeToString: String {
        var volumeToString = String(nowVolume)
        if nowVolume == floor(nowVolume) {
            for _ in 0..<volumeToString.count {
                if volumeToString.last == "." {
                    volumeToString.removeLast()
                    break
                }
                else {
                    volumeToString.removeLast()
                }
            }
        }
        return volumeToString
    }
        
    var nowPriceToString : String {
        var priceToString = String(nowPrice)
        if nowPrice == floor(nowPrice) {
            for _ in 0..<priceToString.count {
                if priceToString.last == "." {
                    priceToString.removeLast()
                    break
                }
                else {
                    priceToString.removeLast()
                }
            }
        } else {
            for _ in 0..<priceToString.count {
                if priceToString.last != "0" {
                    break
                } else {
                    priceToString.removeLast()
                }
            }
        }

        return priceToString
    }
    
    var roundedNowVolume: String {
        let roundedVolume = round(nowVolume * 1000) / 1000
        return String(format: "%.1f", roundedVolume)
    }
    
    var priceRate: String {
        let rate = (nowPrice/beforePrice - 1) * 100
        let roundedRate = round(rate * 100) / 100
        
        return String(format: "%.2f", roundedRate)
    }
    
    var volumeRate: String {
        let rate = (nowVolume/beforeVolume - 1) * 100
        let roundedRate = round(rate * 100) / 100

        return String(format: "%.2f", roundedRate)
    }
    
    
   
}

//// 계산값이 실수가 아닌경우 정수로 처리해주는 함수
//func removePoint(num: String) -> String {
//
//    guard let floatNumString = Double(num) else {
//        return ("오류")
//    }
//    var numString = num
//    if floatNumString == floor(floatNumString) {
//        for _ in 0..<numString.count {
//            if numString.last == "." {
//                numString.removeLast()
//                break
//            }
//            else {
//                numString.removeLast()
//            }
//        }
//    }
//    return numString
//}
