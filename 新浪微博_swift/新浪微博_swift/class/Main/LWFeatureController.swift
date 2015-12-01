//
//  LWFeatureController.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/11/29.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class LWFeatureController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
    }

    private func prepareCollectionView() {
 //    collectionView注册cell
        self.collectionView!.registerClass(LWFeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
//        设置布局  大小
        flowlayout.itemSize = view.bounds.size
//        滚动方向
        flowlayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//        设置间距为0 
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.minimumLineSpacing = 0
//        分页
        collectionView?.pagingEnabled = true
//        取消弹簧效果
        collectionView?.bounces = false
        
    }
    
    //    private let reuseIdentifier = "reuseIdentifier"
    
    //    图片的张数
    let ImageCount = 4
    
    //     创建流水布局
    private var flowlayout = UICollectionViewFlowLayout()
    
    // 实现空参数的构造函数
    init() {
        //        调用需要流水布局的构造函数自己来提供流水布局
        super.init(collectionViewLayout: flowlayout)
    }
    
    //    MARK: - 数据源方法
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageCount
    }
    //   每个cell的显示 内容描述
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    //        获取cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! LWFeatureCell
        
        cell.index = indexPath.item
        
        return cell
    }
    //   这个方法是 一个 cell collectionView 停下来 cell不可见的时候调
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        print("didEndDisplaying\(indexPath)")
        //        在collectionVIew 停下来 我们自己来判断是否是最后一个cell
        //        获取正在显示的cell的 indexPath
        let visibleindexPath = collectionView.indexPathsForVisibleItems().last!
        
        if visibleindexPath.item == ImageCount - 1 {
            // 显示最后一个cell
            
            // 根据indexPath获取cell
            let cell = collectionView.cellForItemAtIndexPath(visibleindexPath) as! LWFeatureCell
            
            cell.startBtnAnimation()
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//   自定义一个cell 显示图片
class LWFeatureCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - 属性
//    显示第几张图片
    var index: Int = 0{
        didSet{
            // 根据是第几个cell显示对应的图片
            bgkImageView.image = UIImage(named: "new_feature_\(index + 1)")
            startBtn.hidden = true
        }
    }
    
    // 切换控制器
    func buttonClick () {
        print("fffffff")
        AppDelegate.switchRootViewController(true)
    }
    
    func startBtnAnimation() {
        // 显示按钮
        startBtn.hidden = false
        
//        设置按钮x。y 缩放
        startBtn.transform = CGAffineTransformMakeScale(0, 0)
        
        UIView.animateWithDuration(1, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
            
//        设置 缩放为1 清空 到原始状态
            self.startBtn.transform = CGAffineTransformIdentity
            }) { (_) -> Void in
                print("动画完成")
        }
    }
    
    private func prepareUI() {
       // 添加子控件
        contentView.addSubview(bgkImageView)
        contentView.addSubview(startBtn)
        // 添加约束
        bgkImageView.translatesAutoresizingMaskIntoConstraints = false
        startBtn.translatesAutoresizingMaskIntoConstraints = false
        // 填充父控件
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[biv]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["biv" : bgkImageView]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[biv]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["biv" : bgkImageView]))
        
        //添加 Btn的约束
        contentView.addConstraint(NSLayoutConstraint(item: startBtn, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: bgkImageView, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: startBtn, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: bgkImageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -160))
        
    }
    // MARK: - 懒加载图片
    private lazy var bgkImageView: UIImageView = UIImageView(image: UIImage(named: "new_feature_1"))
    
    // 开始按钮
    private lazy var startBtn: UIButton = {
        let Btn = UIButton()
        
        Btn.setBackgroundImage(UIImage(named: "new_feature_finish_button"), forState: UIControlState.Normal)
        Btn.setBackgroundImage(UIImage(named: "new_feature_finish_button_highlighted"), forState: UIControlState.Highlighted)
        
        Btn.setTitle("开始体验", forState: UIControlState.Normal)
        
        // 添加点击事件
        Btn.addTarget(self, action: "buttonClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        return Btn
    }()
}









