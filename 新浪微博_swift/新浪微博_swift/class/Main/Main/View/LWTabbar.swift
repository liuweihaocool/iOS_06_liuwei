//
//  LWTabbar.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/23.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWTabbar: UITabBar {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //计算item的宽度
        let width = bounds.size.width / 5
        // 创建frame
        let frame = CGRect(x: 0, y: 0, width: width, height: bounds.size.height)
        
       // 记录是第几个view
        var index = 0
        
        
        for view in self.subviews {
            if view is UIControl && !(view is UIButton) {
                
                view.frame = CGRectOffset(frame, CGFloat(index) * width, 0)
                
                index += index == 1 ? 2:1
            }
        }
        
        composeButton.frame = CGRectOffset(frame, 2 * width, 0)
    }
    
        /**
        *  懒加载
        */
        lazy var composeButton: UIButton = {
            let button = UIButton()
            /**
            *  设置参数  设置按钮背景图片
            */
            button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
            // 高亮状态下的图片
            button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
            // 设置按钮图片
            button.setImage (UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
            //
            button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
            // 添加tabBar里面
            self.addSubview(button)
            // 添加点击事件
//            button.addTarget(self, action: "composeClick", forControlEvents: UIControlEvents.TouchUpInside)
            
            return button
        }()
}
