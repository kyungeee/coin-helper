//
//  BaseInterceptor.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/23.
//

import Foundation
import Alamofire

// api 요청을 보낼때 header에 토큰을 추가한돠?
class BaseInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var request = urlRequest
        
//         헤더 부분 넣어주기
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")

        completion(.success(request))
    }
}

