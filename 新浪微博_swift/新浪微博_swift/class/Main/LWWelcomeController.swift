//
//  LWWelcomeController.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/11/29.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWWelcomeController: UIViewController {
    
    // MARK: - 属性
    /// iconView 底部约束
    private var iconViewBottomCon: NSLayoutConstraint?
    
    // MARK: - 准备UI
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    //在用户看得到view的时候开始做动画
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // 做动画
        moveAnimation()
    }
    
    func moveAnimation() {
        
/*
       普通动画
        // 使用autolayout 布局之后 不要去修改 view的frame，bounds，center的约束
        iconViewBottomCon?.constant = -500
        UIView.animateWithDuration(1, animations: { () -> Void in
        // 使用iconViewBottom，只需要跟新布局
        self.view.layoutIfNeeded()
        }) { (_) -> Void in
        print("完成")
        }
        */
        /*
            duration: NSTimeInterval 弹簧时间
            NSTimeInterval           延时效果时间
            usingSpringWithDamping   弹簧效果的明显程度
            initialSpringVelocity    初始速度
        */
        iconViewBottomCon?.constant = -500
        
        UIView.animateWithDuration(1.2, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
            self.view.layoutIfNeeded()
            }) { (_) -> Void in
                print("完成 动画")
                
                ///切换界面
                AppDelegate.switchRootViewController(true)
        }
        
            
    }


    
    // MARK: - 准备UI
    private func prepareUI() {
        
        // 1. 添加子控件
        view.addSubview(bkgImageView)
        view.addSubview(iconView)
        view.addSubview(messageLabel)
        // 2. 添加约束
        bkgImageView.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        // 背景 填充父控件
        // VFL (可视化格式语言) 作用也使autolayout 来约束比较形象 简化autolayout的代码
        // 左边和右边距离父控件 都为0 
        // format: vfl约束
        // option: 默认
        // metric: 默认
        // views: 参照映射
        
/*
        VFL :
        H:水平方向
        V:垂直方向
        |:父控件的边界
        [] : 表示view
        
        */
        // 左边和右边距离父控件都为0
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[biv]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["biv" : bkgImageView]))
        
        // 顶部和底部距离父控件都为0
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[biv]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["biv" : bkgImageView]))
        
        /// 头像的约束
        view.addConstraint(NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        iconViewBottomCon = (NSLayoutConstraint(item: iconView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -160))
        view.addConstraint(iconViewBottomCon!)
        
        
        /// label约束
         view.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: iconView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 20))
       
        
        
        
    }
    
    
    
    /// 懒加载背景图片
    private lazy var bkgImageView: UIImageView = UIImageView(image: UIImage(named: "ad_background"))
    
    /// 懒加载 头像
    private lazy var iconView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "avatar_default_big"))
        // 设置圆角半径
        view.layer.cornerRadius = 42.5
        view.layer.masksToBounds = true
        return view
    }()
    
    /// 懒加载 消息label
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "欢迎回来"
        label.sizeToFit()
        return label
    }()
}
