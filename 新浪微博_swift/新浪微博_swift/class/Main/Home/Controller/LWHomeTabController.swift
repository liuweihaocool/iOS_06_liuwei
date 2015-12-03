//
//  LWHomeTabController.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/23.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWHomeTabController: LWBaseTableVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 判断用户已经登录 才需要家长 按钮
        if !userLogin {
            return 
        }
        setNav()
        LWNetworkTools.sharedInstance.loadStatus { (result, error) -> () in
            print(result)
            print("qqqqqqqqqqqqqqq\(result?.count)")
        }
        
    }
    /// 设置 首页导航按钮
    private  func setNav() {
        
         let screen_name = LWUserAccount.loadUserAccount()?.screen_name ?? "iOS6"
            
        
        
        // 添加左右边栏 按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "navigationbar_pop")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: "navigationbar_friendsearch")
        
        // 设置标题按钮
        let homeTitleBtn = LWHomeTitleButton(title: screen_name)
        // 把按钮添加到导航栏
        navigationItem.titleView = homeTitleBtn
        
        homeTitleBtn.addTarget(self, action: "homeTitleBtn:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func homeTitleBtn(button: UIButton) {
        // 按钮的点击事件 取反
        button.selected = !button.selected
        
        if button.selected {
            // 给按钮图片添加旋转 动画
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                button.imageView?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) - 0.01)
            })
        } else {
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                button.imageView?.transform = CGAffineTransformIdentity
            })
        }
    }
    // MARK: - tableView的数据源方法 
    // 显示cell的内容
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//    }
    // 返回多少行
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
    
}













