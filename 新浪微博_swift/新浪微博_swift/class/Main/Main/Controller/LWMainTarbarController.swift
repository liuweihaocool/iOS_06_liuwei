//
//  LWMainTabController.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/23.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWMainTarbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 创建homeVC控制器并添加 到tabbar
        let homeVC = LWHomeTabController()
        addChildViewController(homeVC, title: "首页", imageName: "tabbar_home")
        
        //        创建messageVC控制器并且添加到tarBarVC上
        let messageVC = LWMessageTabController()
        addChildViewController(messageVC, title: "消息", imageName: "tabbar_message_center")
        
        //        创建profileVC控制器并且添加到tarBarVC 上
        let profileVC = LWProfileTabController()
        addChildViewController(profileVC, title: "我", imageName: "tabbar_profile")
        
        // 创建 discover 控制器并添加到 tarBarVC
        let discoverVC = LWDiscoverTabController()
        addChildViewController(discoverVC, title: "发现", imageName: "tabbar_discover")
    }
    
    func addChildViewController(contoller: UIViewController, title: String, imageName: String) {
        
        contoller.title = title
        contoller.tabBarItem.image = UIImage(named: imageName)
        addChildViewController(UINavigationController(rootViewController: contoller))
    }
}
















