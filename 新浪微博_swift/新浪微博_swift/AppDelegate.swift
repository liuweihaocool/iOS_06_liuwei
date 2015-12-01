//
//  AppDelegate.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/22.
//  Copyright © 2015年 liuwei. All rights reserved.
//
//LWCollectionViewController(collectionViewLayout: UICollectionViewLayout() 流水布局
//外部提供流水布局 但是不太好 流水布局需要设置参数 让调用的人来设置参数 封装的不是特别好
import UIKit

@UIApplicationMain  //https://git.oschina.net/czbkiosweibo/GZWeibo666.git git 教师案例fd
class AppDelegate: UIResponder, UIApplicationDelegate {
//    声明变量window
    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        appsetup()
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)//创建window
        
        window?.backgroundColor = UIColor.whiteColor()
        /// 创建  tabBarVC 控制器
//        let tabBarVC = LWFeatureController()
        /// 设置  tarBarVC 为根控制器
        window?.rootViewController = defaultController()
        window?.makeKeyAndVisible()//设置keywindow和显示
        return true
        
    }
    
    // MARK: - 判断进入哪个控制器
    private func defaultController() -> UIViewController {
        // 用户是否登录，加载到账户就表示登录
        if !LWUserAccount.userLogin {
            return LWMainTarbarController()
        }
        // 
        return isNewFeature() ? LWFeatureController() : LWWelcomeController()
        
    }
    
    private func switchRootViewController(isMain: Bool) {
        print(isMain)
        window?.rootViewController = isMain ? LWMainTarbarController() : LWWelcomeController()
    }
    
    class func switchRootViewController(isMain: Bool) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).switchRootViewController(isMain)
    }
    
    ///判断是否是新版本
    private func isNewFeature() -> Bool{
        //获取当前版本
        let currentVersion = Double(NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String)!
        // 获取上次版本（从偏好设置）
        let sandboxVersionKey = "sandboxVersionKey"
        //上次的版本号
        let sandboxVersion = NSUserDefaults.standardUserDefaults().doubleForKey(sandboxVersionKey)
        // 保存当前版本
        NSUserDefaults.standardUserDefaults().setDouble(currentVersion, forKey: sandboxVersionKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        return currentVersion != sandboxVersion
    }
    
    
    func appsetup() {
        let bar = UINavigationBar.appearance()
        bar.tintColor = UIColor.orangeColor()
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

