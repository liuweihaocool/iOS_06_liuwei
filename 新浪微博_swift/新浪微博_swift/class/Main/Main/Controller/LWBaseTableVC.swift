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
        view  = LWVistorView()
        view.backgroundColor = UIColor(red: 249 / 255.0, green: 249 / 255.0, blue: 249 / 255.0, alpha: 1)
    }
}
