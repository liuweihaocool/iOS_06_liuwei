//
//  LWStatus.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/12/3.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWStatus: NSObject {
   
    /// 创建时间
    var created_at: String?//"created_at": Wed Nov 25 18:53:55 +0800 2015,
    /// 创建ID
    var id: Int = 0
    /// 微博内容
    var text: String?
    /// 消息来源
    var source: String?
    /// 微博 缩略图 图片地址数组： 数组里面存放的是字典
    var pic_urls: [[String: AnyObject]]?
    /*用户模型，如果不做特殊处理，kvc将返回数据中的字典赋值给user ，
      普通的属性使用kvc赋值，如果user属性我们拦截，不使用kvc赋值
      我们自己来字典转模型，在赋值给user
    */
    var user:LWUser?
    /// 转发数
    var reposts_count: Int = 0
    /// 评论数
    var comments_count: Int = 0
    /// 表态数
    var attitudes_count: Int = 0
    /// kvc设置值
    init(dict: [String:AnyObject]){
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
//    override func setValue(value: AnyObject?, forKey key: String) {
//        if key == "user"{
//           if let dict = value as? [String: AnyObject] {
//            user = LWUser(dict: dict)
//            }
//            return
//        }
//    }
}
