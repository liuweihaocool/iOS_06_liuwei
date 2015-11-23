//
//  LWMainTabController.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/23.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWMainTarbarController: UITabBarController {

    func composeClick() {
        print("ffffff")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newTabBar = LWTabbar()
        setValue(newTabBar, forKey: "tabBar")
        newTabBar.composeButton.addTarget(self, action: "composeClick", forControlEvents: UIControlEvents.TouchUpInside)

        tabBar.tintColor = UIColor.orangeColor()
        // 创建homeVC控制器并添加 到tabbar
        let homeVC = LWHomeTabController()
        addChildViewController(homeVC, title: "首页", imageName: "tabbar_home")
        
        //        创建messageVC控制器并且添加到tarBarVC上
        let messageVC = LWMessageTabController()
        addChildViewController(messageVC, title: "消息", imageName: "tabbar_message_center")
        
        // 占位控制器
//        addChildViewController(UIViewController())
        
        //        创建profileVC控制器并且添加到tarBarVC 上
        let profileVC = LWProfileTabController()
        addChildViewController(profileVC, title: "我", imageName: "tabbar_profile")
        
        // 创建 discover 控制器并添加到 tarBarVC
        let discoverVC = LWDiscoverTabController()
        addChildViewController(discoverVC, title: "发现", imageName: "tabbar_discover")
        
    }
    
    
    /**
     创建tarBar的子窗口
     
     :param: contoller 要传的控制器
     :param: title     标题
     :param: imageName 图片名称
     */
    private func addChildViewController(contoller: UIViewController, title: String, imageName: String) {
       /**
            设置标题
        */
        contoller.title = title
        /** 设置标题颜色
        */
//        contoller.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: UIControlState.Highlighted)
        /** 设置图片
        */
        contoller.tabBarItem.image = UIImage(named: imageName)
        /** 设置高亮图片
        */
        contoller.tabBarItem.selectedImage = UIImage(named: (imageName + "_highlighted"))?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        /**
        *  添加到控制器
        */
        addChildViewController(UINavigationController(rootViewController: contoller))
    }
    

  

}
















