//
//  AuthRouter.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/25.
//

import Foundation
import Alamofire

// 인증 라우터
// 회원가입, 로그인, 토큰갱신
enum AuthRouter: URLRequestConvertible {
    
    case register(name: String ,email: String, password: String)
    case login(email: String, password: String)
    case tokenRefresh
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .register:
            return "user/save"
        case .login:
            return "user/login"
        case .tokenRefresh:
            return "user/token-refresh"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .post
        }
    }
    
    var parameters: Parameters {
        switch self {
        case let .login(email, password):
            var params = Parameters()
            params["id"] = email
            params["password"] = password
            return params
        case let .register(name, email, password):
            var params = Parameters()
            params["name"] = name
            params["id"] = email
            params["password"] = password
            return params
        case .tokenRefresh:
            let params = Parameters()
            //                    let tokenData = UserDefaultsManager.shared.getTokens()
            //                    params["refresh_token"] = tokenData.refreshToken
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        
        request.method = method
        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody

        return request
    }
}
