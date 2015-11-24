//
//  LWBaseTableVC.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/23.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWBaseTableVC: UITableViewController {
 var userLogin = false
    // 如果用户已经登录 就叫做tableVIew
    override func loadView() {
        userLogin ? super.loadView():setupVistorVidew()
    }
    
    /**
     创建访客视图
     */
    private func setupVistorVidew() {
        
        // 使用自定义的访客视图
        view  = vistorView
        view.backgroundColor = UIColor(white: 237 / 255.0, alpha: 1)
        
        print("当前控制器：\(self)")
        // 在这里判断是什么类型的控制器 根据不同的类型 设置不同的访客视图雷人
        if self is LWHomeTabController {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didEnterBackground", name: UIApplicationDidEnterBackgroundNotification, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBecomeActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
            vistorView.rotationAnimation()
        }
        if self is LWMessageTabController {
            vistorView.setupVistorView("visitordiscover_image_message", message: "登陆后别人评论你的微博，发给你消息都会在这里收到通知")
        }
        if self is LWDiscoverTabController {
            vistorView.setupVistorView("visitordiscover_image_message", message: "登陆后，最新最热微博尽在掌握，不会与事实潮流擦肩而过")
        }
        if self is LWProfileTabController {
            vistorView.setupVistorView("visitordiscover_image_profile", message: "登陆后，你得微博，相册，个人资料会显示在这里，展示给别人")
        }
    }
    
    func didEnterBackground() {
        print(__FUNCTION__)
        vistorView.pauseAnimation()
    }
    
    func didBecomeActive() {
        print(__FUNCTION__)
        vistorView.resumeAnimation()
    }
    
    deinit {
        if self is LWHomeTabController {
            NSNotificationCenter.defaultCenter().removeObserver(self)
        }
    }
    
    
    // MARK: - 懒加载
    private lazy var vistorView: LWVistorView = LWVistorView()
}
