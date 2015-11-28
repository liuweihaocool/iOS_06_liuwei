//
//  LWUserAccount.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/11/28.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWUserAccount: NSObject {

/*
     "access_token": 2.00l7VfSG4D7k4B2a8dd3f3ffETQSCD,
     "remind_in": 157679999, 
     "uid": 5772663311, 
     "expires_in": 157679999
    */
    /// 用于access_token地调用 接口获取授权后的access token
    var access_token: String?
    /// accessToken的生命周期 单位是秒  在kvc字典转模型基本数据类型需要设置初始值
    var expires_in: NSTimeInterval = 0
    /// 当前授权用户的UID
    var uid: String?
    /// 字典转模型
    var remind_in: String?
   
    /*
    /// 构造方法 初始化赋值 1
    init(dict: [String: AnyObject]) {
        access_token = dict["access_token"] as! String
        expires_in = dict["expires_in"] as! String
        uid = dict["uid"] as! String
        remind_in = dict["remind_in"] as! String
        super.init()
    }
*/
    
    init(dict: [String: AnyObject]) {
        super.init()
        // 使用kvc 赋值
        setValuesForKeysWithDictionary(dict)
    }
    // 当KVC 赋值 的时候 值为nil 的时候会出错  解决方法 调用这个方法就可以了
    override func setValuesForKeysWithDictionary(keyedValues: [String : AnyObject]) {}
    /// 打印对象信息
    override var description: String{
        return"access_token: \(access_token)"
    }
}
