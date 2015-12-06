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
    /// 用户模型，如果不做特殊处理，KVC会将返回数据中 的字典赋值给 user
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
    /// 重写赋值方法
    override func setValue(value: AnyObject?, forKey key: String) {
        if key == "user" {
            print("user: \(user) value: \(value)")
        }
        super.setValue(value, forKey: key)
    }
    /// kvc 字典转模型时 如个nil会报错
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        let properties = ["created_at", "id", "text", "source", "pic_urls", "reposts_count", "comments_count", "attitudes_count", "user"]
        // 根据传人的数组作为字典的key  value会从模型里面自动获取
        
        return "\n \t 模型:\(dictionaryWithValuesForKeys(properties))"
    }
    /// 获取微博数据
    class func loadStatus(finished: (statuses: [LWStatus]?, error: NSError?) ->()) {
        
        // 调用网络工具类获取Status
        LWNetworkTools.sharedInstance.loadStatus { (result, error) -> () in
            
            // 没有加载到数据
            if error != nil || result == nil{
                print("error:\(error)")
                finished(statuses: nil, error: error)
                return
            }
            // 加载到了 数据
            if let arr = result!["statuses"] as? [[String: AnyObject]] {
                // 能来到这里 status 数据没有问
                // 创建一个数字来存放转好的模型
                var statuses = [LWStatus]()
                for dict in arr {
                    let status = LWStatus(dict: dict)
                    statuses.append(status)
                }
                finished(statuses: statuses, error: nil)
            }else{ // arr 为空
                finished(statuses: nil, error: nil)
            }
            
        }
    }
}
