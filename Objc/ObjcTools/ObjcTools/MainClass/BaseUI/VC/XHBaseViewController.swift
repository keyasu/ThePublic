//
//  XHBaseViewController.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

import UIKit

class XHBaseViewController: UIViewController {
    
    private(set) var disposeBag = DisposeBag()
    
    var titleStr: String {
        get {
            return "标题"
        }
        set {
            self.gk_navTitle = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //在vc最开始初始化的时候直接将dispostBag给初始化了, 省的后面报错了的呢,
        disposeBag = DisposeBag()
        
        view.backgroundColor = UIColor.hex_FFFFFF
        
        leftBarItem()
        
        setupUI()
        setupUINavigation()
        prepareView()
        
        self.gk_navLineHidden = true
        
    }
    
    ///请求数据
    func requestList() {}
    
    func setupUI() {
        
    }
    func prepareView() {

    }
    
    /// 设置 nav bar的各种属性
    func setupUINavigation() {
        self.gk_navTitleFont = UIFont.fontWith_DINAlternateFont_Bold_fontSize(36)
        self.gk_navTitleColor = .hex_00184C
    }
    
    //设置左边按钮
    func leftBarItem(_ imgStr: String = "back_personal_back") {

        self.gk_navLeftBarButtonItem = UIBarButtonItem.gk_item(withTitle: nil, image: imgStr.toImg(), target: self, action: #selector(leftBarItemAction))
    }

    @objc
    func leftBarItemAction() {
        self.popViewController()
    }
    //设置右边按钮
    func rightBarItem(_ imgStr: String = "back_personal_back") {
        self.gk_navRightBarButtonItem = UIBarButtonItem.gk_item(withTitle: nil, image: imgStr.toImg(), target: self, action: #selector(rightBarItemAction))
    }
    @objc
    func rightBarItemAction() {
        self.popViewController()
    }
    
    // MARK: - 获取通常情况下的页面view frame,通过safeArea实现
    ///获取通常情况下的页面view frame,通过safeArea实现
    func getNormalViewFrame(_  tabBar:Bool) -> CGRect {
        
        var b = self.navigationController?.navigationBar.isHidden
        
        if let _ = b
        {
            PrintLog("navbar 解包成功")
        }else{
            
            b = true
        }
        
        if b! {
            let yy = self.sefaArea().top+NavBarHeight
            return CGRect.init(x: 0, y: yy,
                               width:SRNW,
                               height:SRNH  - yy)
            
        }else{
            //====未隐藏navbar tabbar时一般view frame的计算======
            //x的tabbar高度其实是83 = 34（self.sefaArea().bottom） + 49（tabbar）
            //self.sefaArea().top 包含了刘海，statusbar高度 44 896
            return  CGRect.init(x: 0, y: 0, width:SRNW, height:SRNH  - self.sefaArea().top - NavBarHeight - self.sefaArea().bottom - (tabBar ? TabBarHeight:0))
        }
    }
    // MARK: - 返回safeArea
    /// 返回safeArea
    func sefaArea() -> UIEdgeInsets {
        
        if #available(iOS 11.0, *) {
            let insets = UIApplication.shared.delegate?.window??.safeAreaInsets ?? UIEdgeInsets.zero
            
            if insets.top == 0 {
                //非x类型的机器，为了计算方便已statusbar为safearea
                return UIEdgeInsets.init(top: StatusBarHeight, left: 0, bottom: 0, right: 0)
            }
//            PrintLog(insets)
            //UIEdgeInsets(top: 44.0, left: 0.0, bottom: 34.0, right: 0.0) x normal情况下是这个
            if self.navigationController != nil {
                // x类型的机器 另外在算算 , 随后在适配吧
                
                return isiPhoneX ? insets : UIEdgeInsets.zero
            }else {
                return insets
            }
           
        } else {
            // Fallback on earlier versions
            //非x类型的机器，为了计算方便已statusbar为safearea
            return UIEdgeInsets.init(top: StatusBarHeight, left: 0, bottom: 0, right: 0)
        }
    }
    


}
