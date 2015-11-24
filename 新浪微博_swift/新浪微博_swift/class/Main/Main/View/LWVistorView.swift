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
    
    //准备UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }

//    添加子控件
    private func prepareUI() {
        
        addSubview(iconView)
        addSubview(homeView)
        addSubview(messageLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        //添加结束 autolayout 注意：要设置约束的view 有父控件 后才能设置他的自动布局约束
        //关闭autoresizing，不要让他干扰antolayout 的约束  约束需要添加到view上面如果
        //如果不清楚添加到自身还是父控件，可以直接添加到父控件
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        homeView.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        /*
            创建约束对象  iconView CenterX与父控件的centerX重合
        
        */
        /**
        *  <#Description#>
        *
        *  @param iconView                  被约束的对象
        *  @param NSLayoutAttribute.CenterX 被约束对象的 轴
        *  @param NSLayoutRelation.Equal    被约束对象与约束对象的关系 大于 等于 小于
        *  @param self                      被约束对象的父控件
        *  @param NSLayoutAttribute.CenterX 被约束对象的父控件 的 那个 轴
        *  @param 1                         倍数
        *  @param 0                         坐标偏移
        *
        *  @return <#return value description#>
        */
        // 转盘
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
//        小房子
        self.addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: homeView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
//        文本框
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 40))
        self.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 250))
//        注册按钮
        self.addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 90))
        self.addConstraint(NSLayoutConstraint(item: registerBtn, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
//        登陆按钮
        self.addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: messageLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 10))
        self.addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 90))
        self.addConstraint(NSLayoutConstraint(item: loginBtn, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 35))
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
