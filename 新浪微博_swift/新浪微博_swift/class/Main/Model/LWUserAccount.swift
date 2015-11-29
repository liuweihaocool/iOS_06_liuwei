//
//  LWUserAccount.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/11/28.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWUserAccount: NSObject, NSCoding{

    
    // MARK: - 属性
    
    /// 是否登录
    class var userLogin: Bool {
        get {
            return LWUserAccount.loadUserAccount() != nil
        }
    }

    /// 用于access_token地调用 接口获取授权后的access token
    var access_token: String?
    
    
    /// accessToken的生命周期 单位是秒  在kvc字典转模型基本数据类型需要设置初始值
    var expires_in: NSTimeInterval = 0 {
        didSet {
            //设置过期时间
            expirsDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    /// 当前授权用户的UID
    var uid: String?
    

   
    /// 保存过期时间
    var expirsDate: NSDate?
    /// 内存中的账号
    
    
    init(dict: [String: AnyObject]) {
        super.init()
        // 使用kvc 赋值
        setValuesForKeysWithDictionary(dict)
    }
    // 当KVC 赋值 的时候 值为nil 的时候会出错  解决方法 调用这个方法就可以了
    override func setValue(value: AnyObject?, forUndefinedKey key: String) { }
    /// 打印对象信息
    override var description: String{
        return "access_token: \(access_token), expires_in\(expires_in), uid\(uid), expirsDate\(expirsDate) "
    }
    private static var userAcceount: LWUserAccount?

    
    static let plistPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/account.plist"
    /// 保存账号信息到沙盒
    func saveAccount() {
        //归档 当前类
        NSKeyedArchiver.archiveRootObject(self, toFile: LWUserAccount.plistPath)
    }
    
    ///读取沙盒中的账号信息
    class func loadUserAccount() ->LWUserAccount? {
//        if let account = NSKeyedUnarchiver.unarchiveObjectWithFile(plistPath) as? LWUserAccount {
//            
//            
//            print("account.expiresDate:\(account.expirsDate)===NSDate:\(NSDate())")
//            
//            if account.expirsDate?.compare(NSDate()) == NSComparisonResult.OrderedDescending {
//                print("没有过期")
//                return account
//            }
//        }
        // 1 判断内存中的账户是可用的
        if userAcceount == nil {
            print("从内存中加载数据\(userAcceount)")
            // 内存中没有账户 到沙盒加载账户 赋值给内存中的账户
        
            userAcceount = NSKeyedUnarchiver.unarchiveObjectWithFile(plistPath) as? LWUserAccount
        }else{
            print("从内存中加载数据")
        }
        
        // 2 判断内存中是可用账户 有账户 判断时间是否过期
        if userAcceount != nil && userAcceount?.expirsDate?.compare(NSDate()) == NSComparisonResult.OrderedDescending {
            print("过期时间\(userAcceount)")
            // 有账户并且没有过期，是一个可用的账户
            return userAcceount
        }
        
        return nil
    }
    
    /// 解档
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expires_in = aDecoder.decodeDoubleForKey("expires_in")
        expirsDate = aDecoder.decodeObjectForKey("expirsDate") as? NSDate
        uid = aDecoder.decodeObjectForKey("uid") as? String
    }
    
    /// 归档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeDouble(expires_in, forKey: "expires_in")
        aCoder.encodeObject(expirsDate, forKey: "expirsDate")
        aCoder.encodeObject(uid, forKey: "uid")
    }
}
