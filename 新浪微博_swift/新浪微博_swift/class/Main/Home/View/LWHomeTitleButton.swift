//
//  LWHomeTitleButton.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/12/1.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWHomeTitleButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// 自动布局子控件
    override func layoutSubviews() {
        /// 一定要调用父类的 layoutSubViews
        super.layoutSubviews()
        /// 交换 按钮的图片和位置
        titleLabel?.frame.origin.x = 0
        /// 见图片移动到label的右边
        imageView?.frame.origin.x = (titleLabel?.frame.size.width)! + 3
    }
    
    init(title: String) {
        super.init(frame: CGRectZero)
        // 设置 图片
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        // 设置文字
        setTitle(title, forState: UIControlState.Normal)
        // 设置字体颜色
        setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sizeToFit()//自适应尺寸
    }

   
}
