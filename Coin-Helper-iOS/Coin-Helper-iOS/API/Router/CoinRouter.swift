//
//  CoinRouter.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/12/27.
//

import Foundation
import Alamofire

enum CoinRouter: URLRequestConvertible {
    
    case volume(unit: Int)
    case price(unit: Int)
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case let .volume(unit) :
            return "coin/volume/ranking/\(unit)"
        case let .price(unit) :
            return "coin/price/ranking/\(unit)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default :
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        default :
            let params = Parameters()
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        
        request.method = method

        return request
    }
    
}
