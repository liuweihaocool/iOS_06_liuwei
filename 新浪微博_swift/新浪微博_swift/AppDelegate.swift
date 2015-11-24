//
//  AppDelegate.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/22.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

@UIApplicationMain//https://git.oschina.net/czbkiosweibo/GZWeibo666.git git 教师案例fd 
class AppDelegate: UIResponder, UIApplicationDelegate {

//    声明变量window
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)//创建window
        /// 创建  tabBarVC 控制器
        let tabBarVC = LWMainTarbarController()
        /// 设置  tarBarVC 为根控制器
        window?.rootViewController = tabBarVC
        
        window?.makeKeyAndVisible()//设置keywindow和显示
        return true
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

