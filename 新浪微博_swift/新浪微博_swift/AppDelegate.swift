//
//  AppDelegate.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/22.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

@UIApplicationMain//https://git.oschina.net/czbkiosweibo/GZWeibo666.git git 教师案例
class AppDelegate: UIResponder, UIApplicationDelegate {

//    声明变量window
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)//创建window
        /// 创建  tabBarVC 控制器
        let tabBarVC = LWMainTarbarController()
        /// 设置  tarBarVC 为根控制器
        window?.rootViewController = tabBarVC
        
//        // 创建homeVC控制器并添加 到tabbar
//        let homeVC = LWHomeTabController()
//        homeVC.title = "首页"
//        homeVC.tabBarItem.image = UIImage(named: "tabbar_home")
//        tabBarVC.addChildViewController(UINavigationController(rootViewController:homeVC))
//        
////        创建messageVC控制器并且添加到tarBarVC上
//        let messageVC = LWMessageTabController()
//        messageVC.title = "消息"
//        messageVC.tabBarItem.image = UIImage(named: "tabbar_message_center")
//        tabBarVC.addChildViewController(UINavigationController(rootViewController: messageVC))
//        
////        创建profileVC控制器并且添加到tarBarVC 上
//        let profileVC = LWProfileTabController()
//        profileVC.title = "我"
//        profileVC.tabBarItem.image = UIImage(named: "tabbar_profile")
//        tabBarVC.addChildViewController(UINavigationController(rootViewController: profileVC))
//        
//        // 创建 discover 控制器并添加到 tarBarVC
//        let discoverVC = LWDiscoverTabController()
//        discoverVC.title = "发现"
//        discoverVC.tabBarItem.image = UIImage(named: "tabbar_discover")
//        tabBarVC.addChildViewController(UINavigationController(rootViewController: discoverVC))
        
        
        window?.makeKeyAndVisible()//设置keywindow和显示
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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

