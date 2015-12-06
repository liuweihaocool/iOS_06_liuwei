//
//  LWUser.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/12/3.
//  Copyright © 2015年 liuwei. All rights reserved.


import UIKit

class LWUser: NSObject {

    /// 用户UID
    var id: Int = 0
    /// 用户昵称
    var screen_name: String?
    /// 头像
    var profile_image_url:String?
    /// 是否是微博认证用户 返回 bool
    var verified:Bool = false
    /// verified_type 没有认证 ：-1  认证用户：0 企业认证：2.3.5 达人：220
    var verified_type:Int = -1
    /// 会员等级
    var mbrank:Int = 0
    
    /// KVC设值 值为nil会报错 解决方案：要重写下面的方法
    init(dict:[String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    /// 打印
    override var description: String {
        
        
        let properties = ["id","screen_name","profile_image_url","verified","verified_type","mbrank"]
        
        
        return "用户模型：\(dictionaryWithValuesForKeys(properties))"
    }
    
}










