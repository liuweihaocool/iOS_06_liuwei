//
//  LWPlaceholdView.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/12/5.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit
/// 自定义TextView 里面有一个站位文本，当没有内容的时候会显示出来
class LWPlaceholdView: UITextView {
    /// 提供属性，让别人来设置文本
    var placeholder: String? {
        didSet {
            placeHolderLabel.text = placeholder
            placeHolderLabel.font = font
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// 实现通知方法
    func textDidChange() {
        placeHolderLabel.hidden = hasText()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        // 调用父类的init
        super.init(frame: frame, textContainer: textContainer)
        // 设置代理
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textDidChange", name: UITextViewTextDidChangeNotification, object: self)
    }
    
    /// 移除通知 相当于dealloc
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    

    
 
    
    /// 懒加载 站位文本 提供label给别人访问，别人可能会做非法操作
    private lazy var placeHolderLabel:UILabel = {
        /// 创建label 设置属性
        let label = UILabel()
        label.textColor = UIColor.lightGrayColor()
        label.font = self.font
        
        /// 添加约束
        self.addSubview(label)
        
        /// 取消系统的自动约束
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 8))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 5))
        
        label.sizeToFit()
        
        return label
    }()
}
