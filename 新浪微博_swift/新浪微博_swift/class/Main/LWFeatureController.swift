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
        }
    }
    
    private func prepareUI() {
       // 添加子控件
        contentView.addSubview(bgkImageView)
        // 添加约束
        bgkImageView.translatesAutoresizingMaskIntoConstraints = false
        // 填充父控件
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[biv]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["biv" : bgkImageView]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[biv]-0-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["biv" : bgkImageView]))
        
    }
    // MARK: - 懒加载图片
    private lazy var bgkImageView: UIImageView = UIImageView(image: UIImage(named: "new_feature_1"))
}









