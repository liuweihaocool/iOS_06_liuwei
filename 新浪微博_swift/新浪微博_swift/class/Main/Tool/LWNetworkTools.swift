//
//  LWNetworkTools.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/11/26.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit
import AFNetworking
class LWNetworkTools: AFHTTPSessionManager {
    ///AFN 网络请求单例
    static let sharedInstance: LWNetworkTools = {
        
        let baseURL = NSURL(string: "https://api.weibo.com/")
        let tool = LWNetworkTools(baseURL:baseURL)
        return tool
    }()
    private let client_secret = "18b413bfcd4901df25ecd26e02f44321"
    // MARK: - Oauth授权
    /// 申请的AppKey
    private let client_id = "1267051801"
    /// 授权回调地址
    let redirect_uri = "http://www.baidu.com"
    /// 返回授权界面的URL地址
    func oauthURL() ->NSURL {
        // get 方式拼接登陆界面请求地址
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_id)&redirect_uri=\(redirect_uri)"

        return NSURL(string: urlString)!
    }
    
    
    // 加载 accessToken
    func loadAccessToken(code: String) {
        // URL地址
        let urlString = "https://api.weibo.com/oauth2/access_token"
        // 请求参数
        let parameters = [
            "client_id":client_id,
            "client_secret":client_secret,
            "grant_type":"authorization_code",
            "code":code,
            "redirect_uri":redirect_uri
        ]
        POST(urlString, parameters: parameters, success: { (_, result) -> Void in
            <#code#>
            }) { (_, error) -> Void in
                <#code#>
        }
    }
}
