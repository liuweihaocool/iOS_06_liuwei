//
//  LWVistorView.swift
//  新浪微博_swift
//
//  Created by liuwei on 15/11/23.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit
/*
    frame: 
        origin:位置（相对父控件）
        size:设置大小（写死的数值）
    autolayout:
        位置:参照比较丰富
        大小:参照比较丰富
*/

// 访客视图
class LWVistorView: UIView {
    
    // swift默认所有的view都能通过 xib 、storyboard 加载
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    private func prepareUI() {
        
        addSubview(iconView)
        addSubview(homeView)
        addSubview(messageLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
    }
    
    // 懒加载  小房子
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house" ))
    // 懒加载  转轮
    private lazy var homeView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    // 懒加载  消息label
    private lazy var messageLabel: UILabel = {
        //创建 label
        let label = UILabel()
        //设置字体颜色
        label.textColor = UIColor.darkGrayColor()
        //添加文字
        label.text = "关注一群人，走走停停，看看有什么惊喜"
        //设置换行 0 为自动
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    
    ///  懒加载 登陆按钮
    private lazy var loginBtn: UIButton = {
        //实例化
       let btn = UIButton()
        //设置按钮的背景图片
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        //设置文字
        btn.setTitle("登陆", forState: UIControlState.Normal)
        //设置文本颜色
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        //设置文本大小
        btn.titleLabel?.font = UIFont.systemFontOfSize(14)
        //根据内容适应大小
        btn.sizeToFit()
        return btn
    }()
    
    ///  懒加载  注册按钮
    private lazy var registerBtn: UIButton = {
        //实例化
        let btn = UIButton()
        //设置按钮的背景图片
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        //设置文字
        btn.setTitle("注册", forState: UIControlState.Normal)
        //设置文本颜色
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        //设置文本大小
        btn.titleLabel?.font = UIFont.systemFontOfSize(14)
        //根据内容适应大小
        btn.sizeToFit()
        return btn
    }()
}
