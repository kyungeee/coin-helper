//
//  ApiClient.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/23.
//

import Foundation
import Alamofire


// api 호출 클라이언트
final class ApiClient {
    static let shared = ApiClient() // 싱글턴
    
    // baseURL 마다 client를 만들어주는게 좋다!
    static let BASE_URL = "http://118.221.192.176:8080/"

    let interceptors = Interceptor(interceptors: [
        BaseInterceptor() // application/json
    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session
    
    init() {
        print("ApiClient - init() called")
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
}


