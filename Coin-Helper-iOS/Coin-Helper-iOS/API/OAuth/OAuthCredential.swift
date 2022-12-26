//
//  OAuthCredential.swift
//  Coin-Helper-iOS
//
//  Created by 박희경 on 2022/11/27.
//

import Foundation
import Alamofire

struct OAuthCredential : AuthenticationCredential {
    
    let accessToken: String // 현재 쓰는 토큰
    
    let refreshToken: String // 현재 지금 토큰이 만료가 되면 새로 이 토큰을 가지고 서버에 api 요청을 주면

    let expiration: Date // 언제 이 토큰이 만료되냐

    // Require refresh if within 5 minutes of expiration
    var requiresRefresh: Bool { Date(timeIntervalSinceNow: 60 * 5) > expiration }
    
}


