//
//  LWOauthViewController.swift
//  新浪微博_swift
//
//  Created by LiuWei on 15/11/26.
//  Copyright © 2015年 liuwei. All rights reserved.
//

import UIKit
import SVProgressHUD

class LWOauthViewController: UIViewController {
    
    override func loadView() {
//        不用设置约束
        view = WebView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建请求数据连接地址
        let resquest = NSURLRequest(URL: LWNetworkTools.sharedInstance.oauthURL())
        // 加载数据到 WebView
        WebView.loadRequest(resquest)
        
        WebView.delegate = self
        
        //添加左边导航按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "填充", style: UIBarButtonItemStyle.Plain, target: self, action: "autoFill")
        //添加右边导航按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "close")
    }
    
    
    /// js 填充账号 密码
    func autoFill(){
        let js = "document.getElementById('userId').value='liuweihaocool@126.com'; document.getElementById('passwd').value='qq4921349'"
         WebView.stringByEvaluatingJavaScriptFromString(js)
    }
    func close() {
        SVProgressHUD.dismiss()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//    MARK: - 懒加载WebView
    private lazy var WebView = UIWebView()
    
    func loadAccessToken(code: String) {
        
    }
}

// MARK - 扩展LWOauthViewController 实现UIViewDelegate
extension LWOauthViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        // 一直显示 直到 主动关闭
        SVProgressHUD.showInfoWithStatus("fsdf")
        //
        SVProgressHUD.showWithStatus("正在加载", maskType: SVProgressHUDMaskType.None)
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    ///每当加载链接都会通过这个代理方法来询问我们  这个地址是否是否可以加载 true 表示可以 false就不加载
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let urlString = request.URL!.absoluteString
        
        print(urlString)
        // 判断是否以 http://www.baidu.com 开头 如果是就 往下走  不是就退出
        if !urlString.hasPrefix(LWNetworkTools.sharedInstance.redirect_uri) {
            
            return true
        }

        if let query = request.URL?.query {
            if query.hasPrefix("code=") {
                /// 截取 code= 后面的字符串
                let code = (query as NSString).substringFromIndex("code=".characters.count)
                loadAccessToken(code)
                
            }else {
                self.close()
            }
        }
        return false
    }
}








