//
//  UserRouter.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/27.
//

import Foundation
import Alamofire

// 사용자 라우터
// 현재 로그인한 사용자 정보, 모든 사용자 가져오기
enum UserRouter: URLRequestConvertible {
    
    case fetchCurrentUserInfo
    case fetchUsers
    case testFetchUserInfo
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .fetchUsers:
            return "user/all"
        case .fetchCurrentUserInfo:
            return "user/info"
        case .testFetchUserInfo:
            return "user/findById/\(UserDefaultManager.getEmail())"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        default: return Parameters()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        
        request.method = method

        return request
    }
}

