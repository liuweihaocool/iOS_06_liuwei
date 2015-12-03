//
//  Extension.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/12/1.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
//    // MARK: - 设置导航栏
//    class func createBarButton(image: String) -> UIBarButtonItem {
//        // 创建按钮
//        let Btn = UIButton()
//        // 设置按钮背景图片
//        Btn.setBackgroundImage(UIImage(named: image), forState: UIControlState.Normal)
//        Btn.setBackgroundImage(UIImage(named: image + "_highlighted"), forState: UIControlState.Highlighted)
//        // 适应尺寸
//        Btn.sizeToFit()
//        return UIBarButtonItem(customView: Btn)
//    }
    
    
    /// 在extension 构造函数只能是 便利构造函数  函数构造的每一个参数多有外部的参数名
    convenience init(image: String) {
        // 创建按钮
        let Btn = UIButton()
        // 设置按钮背景图片
        Btn.setBackgroundImage(UIImage(named: image), forState: UIControlState.Normal)
        Btn.setBackgroundImage(UIImage(named: image + "_highlighted"), forState: UIControlState.Highlighted)
        // 适应尺寸
        Btn.sizeToFit()
        
        self.init(customView: Btn)
    }
}