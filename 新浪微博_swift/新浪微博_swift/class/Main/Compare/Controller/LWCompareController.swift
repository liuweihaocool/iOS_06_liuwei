//
//  LWCompareController.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/12/5.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

class LWCompareController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置viw的背景颜色
        view.backgroundColor = UIColor(white: 0.5, alpha: 1)
        // 设置导航栏
        prepareUI()
    }
    /// 准备UI
    private func prepareUI() {
        /// 导航栏
        setupNavigationBar()
        /// 文本框
        setupTextView()
        /// 工具条        
        setupToolBar()
    }
    
    /// 设置文本
     func setupTextView() {
        /// 添加子控制器
        view.addSubview(textView)
        /// 去除系统的约束
        textView.translatesAutoresizingMaskIntoConstraints = false
        /// 自定义约束
        view.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        
        // 设置代理来监听文本的改变
        textView.delegate = self
    }
    
    /// 设置导航栏按钮
    private func setupNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "closeWindow")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发送", style: UIBarButtonItemStyle.Plain, target: self, action: "sendMessage")
        setupTitle()
        
        // 设置发送按钮不可用
        navigationItem.rightBarButtonItem?.enabled = false
    }
    /// 设置导航栏标题
    private func setupTitle(){
        if let name = LWUserAccount.loadUserAccount()?.screen_name {
            // 创建label
            let label = UILabel()
            // 设置字体
            label.font = UIFont.systemFontOfSize(14)
            // 设置文字
            label.text = name + "\n" + "发送的微博"
            // 设置字体颜色
            label.textColor = UIColor.redColor()
            // 换行
            label.numberOfLines = 0
            
            let attText = NSMutableAttributedString(string: label.text!)
            
            let nameRange = (name as NSString).rangeOfString(name)
            
            attText.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: nameRange)
            
            label.attributedText = attText
            
            label.textAlignment = NSTextAlignment.Center
            // 适应大小
            label.sizeToFit()
            // 为title赋值
            navigationItem.titleView = label
        } else {
            navigationItem.title = "发送微博"
        }
    }
    
    /// 关闭控制器 @obj修饰 private
    @objc private func closeWindow() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /// 发送微博的实现
    @objc private func sendMessage() {
        print("发送微博")
    }
    

    
//    private lazy var textView:LWPlaceholdView = {
//        // 实例化对象
//        let textView = LWPlaceholdView()
//        // 设置背景颜色
//        textView.backgroundColor = UIColor.lightTextColor()
//        // 字体
//        textView.font = UIFont.systemFontOfSize(20)
////        // 滚动条
//        textView.alwaysBounceVertical = true
//        
//        
//        let placeHolderLabel = UILabel()
//        
//        placeHolderLabel.textColor = UIColor.lightTextColor()
//        placeHolderLabel.font = textView.font
//        
//        placeHolderLabel.text = "分享新鲜事"
//        
//        placeHolderLabel.sizeToFit()
//        
//        
////
////        // 拖拽的时候会 退出键盘
//        textView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.OnDrag
////
////        // 站位文本
//        
//        
//        return textView
//    }()
    
    private lazy var textView:LWPlaceholdView = {
        
        let tv = LWPlaceholdView()
        tv.backgroundColor = UIColor.brownColor()
        tv.alwaysBounceVertical = true
        

        tv.placeholder = "分享新鲜事"
        return tv
    }()
    
    private func setupToolBar() {
        /// 添加toolbar到 view
        view.addSubview(toolBar)
        /// 去掉系统的自动约束
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        // 约束 X轴
        view.addConstraint(NSLayoutConstraint(item: toolBar, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0))
        // 约束 Y轴
        view.addConstraint(NSLayoutConstraint(item: toolBar, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0))
        // 约束宽度
        view.addConstraint(NSLayoutConstraint(item: toolBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0))
        // 约束高度
        view.addConstraint(NSLayoutConstraint(item: toolBar, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 44))
        
        // 添加item对应的图片名称
        let itemSettings = [["imageName":"compose_toolbar_picture","action":"picture"],
            ["imageName":"compose_trendbutton_background","action":"trend"],
            ["imageName":"compose_mentionbutton_background","action":"mention"],
            ["imageName":"compose_emoticonbutton_background","action":"emotion"],
            ["imageName":"compose_addbutton_background","action":"add"]]
        // 存放UIBarButtonItem
        var items = [UIBarButtonItem]()
        
        // 通过for循环遍历数组的图片名称
        for dict in itemSettings {
            let imageName = dict["imageName"]
            let item = UIBarButtonItem(image: imageName!)
            let action = dict["action"]
            
            // 获取UIBarbutton的customView 是一个按钮
            let button = item.customView as! UIButton
            // 添加点击事件
            button.addTarget(self, action: Selector(action!), forControlEvents: UIControlEvents.TouchUpInside)
            // 填加到数组
            items.append(item)
            // 添加弹簧
            items.append(UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil))
            
        }
        items.removeLast()
        toolBar.items = items
    }
    
    /// 懒加载
    private lazy var toolBar:UIToolbar = {
        // 实例化uitoolBar
        let tool = UIToolbar()
        tool.backgroundColor = UIColor.redColor()
        
        return tool
    }()
    
    func picture() {
        print("fff")
    }
    
    func trend() {
        print("fff")
    }
    func mention() {
        print("fff")
    }
    
    func emotion() {
        print("fff")
    }
    
    func add() {
        print("fff")
    }
}

// 扩展当前控制器 实现UItextViewDelegate 来监听文本值得改变
extension LWCompareController:UITextViewDelegate {
    
    func textViewDidChange(textView: UITextView) {
        // 设置导航栏右边按钮的状态
        navigationItem.rightBarButtonItem?.enabled = textView.hasText()
    }
}
