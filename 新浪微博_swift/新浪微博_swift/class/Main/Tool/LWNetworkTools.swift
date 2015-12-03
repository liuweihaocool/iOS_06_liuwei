//
//  LWNetworkTools.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/11/26.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit
import AFNetworking
/// 统一管理错误
enum LWNetWorkToolError: Int {
    case EmptyAccessToken = -1
    case EmpthUid = -2
    //属性 根据不同的枚举类型返回不同的值
    var description: String {
        switch self {
        case .EmptyAccessToken:
            return "accessToken没有值"
        case .EmpthUid:
            return"Uid没有值"
        }
    }
    func error() -> NSError {
        return NSError(domain: "cn.itcast.net", code: self.rawValue, userInfo: ["description":  self.description])
    }
}
/// AFN 单例的实例化方法
class LWNetworkTools: AFHTTPSessionManager {
    ///AFN 网络请求单例
    static let sharedInstance: LWNetworkTools = {
        
        let baseURL = NSURL(string: "https://api.weibo.com/")
        let tool = LWNetworkTools(baseURL:baseURL)
        tool.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tool
    }()
    /// 程序的编号
    private let client_secret = "18b413bfcd4901df25ecd26e02f44321"
    /// 申请的AppKey
    private let client_id = "1267051801"
    /// 授权回调地址
    let redirect_uri = "http://www.5566.org"
    /// 返回授权界面的URL地址
    func oauthURL() ->NSURL {
        // get 方式拼接登陆界面请求地址
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(client_id)&redirect_uri=\(redirect_uri)"

        return NSURL(string: urlString)!
    }
    
    
    
    // MARK - 获取 用户信息  网络工具类只负责加载数据
    func loadUserInfo(finished:(result:[String: AnyObject]?,error: NSError?) ->()) {
        // 守卫 当 access_tlken 为空的时候执行下面方法
        guard let access_token = LWUserAccount.loadUserAccount()?.access_token else {
            // 获取数据失败返回错误信息
            print(LWNetWorkToolError.EmptyAccessToken.error())
            finished(result: nil, error: LWNetWorkToolError.EmptyAccessToken.error())
            return
        }
        
        guard let uid = LWUserAccount.loadUserAccount()?.uid else {
            // 连接失败返回 错误信息
            finished(result: nil, error: LWNetWorkToolError.EmptyAccessToken.error())
            return
        }
        // url
        let urlString = "2/users/show.json"
        // 参数
        let parameter = [
            "access_token" : access_token,
            "uid" : uid
        ]
        requestGET(urlString, parameters: parameter as [String: AnyObject], finished: finished)

    }
    
    // 获取授权 的token
    func loadAccessToken(code: String, finished: (result: [String: AnyObject]?,error:NSError?) -> ()) {
        //url 地址
        let urlString = "https://api.weibo.com/oauth2/access_token"
        //请求参数
        let parameters = [
            "client_id": client_id,
            "client_secret": client_secret,
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri" : redirect_uri
        ]

        requestPOST(urlString, parameters: (parameters as [String: AnyObject]), finished: finished)
    }
    
    // 加载微博
    func loadStatus(finished:(result:[String: AnyObject]?,error: NSError?) ->()) {
        /// url
        let urlString = "https://api.weibo.com/2/statuses/home_timeline.json"
        /// 请求参数
        guard let access_token = LWUserAccount.loadUserAccount()?.access_token else {
            return
        }
        let parameters = ["access_token": access_token]
        requestGET(urlString, parameters: parameters, finished: finished)
        
    }
    
    func requestGET(urlString: String,parameters: [String: AnyObject],finished:(result:[String: AnyObject]?,error: NSError?) ->()) {
        GET(urlString, parameters: parameters, success: { (_, result) -> Void in
            finished(result: result as? [String: AnyObject], error: nil)
            }) { (_, error) -> Void in
                finished(result: nil, error: error)
        }
    }
    
    func requestPOST(urlString: String,parameters:[String:AnyObject],finished: (result: [String: AnyObject]?,error:NSError?) -> ()) {
        POST(urlString, parameters: parameters, success: { (_, result) -> Void in
            // as! 强制转换，如果转换不了直接奔溃  as？ 如果能转换成功就转换  不能转换就返回nil
            finished(result: result as? [String: AnyObject], error:nil)
            }) { (_, error) -> Void in
                finished(result: nil, error: error)
        }
    }
}











