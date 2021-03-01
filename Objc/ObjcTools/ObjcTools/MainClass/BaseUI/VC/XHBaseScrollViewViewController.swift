//
//  XHBaseScrollViewViewController.swift
//  ObjcTools
//
//  Created by douhuo on 2021/3/1.
//  Copyright © 2021 wangergang. All rights reserved.
//

import UIKit

class XHBaseScrollViewViewController: XHBaseViewController {

    
    /// 当前页面
    var page = 1
    /// 当前的size
    var pageSize = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /// 刷新 tableview
    func reloadTBView() {}
    
    /// 停止架子啊动画
    func stopAnimation() {}
    // MARK: - 请求数据，供具体子类覆盖
    /// 请求数据，供具体子类覆盖
    override func requestList() {}
    /// 加载更多
    func loadMoreTableView() {}
    
    // MARK: - 这个方法给子类设置 tableView 的 样式 ，frame pageSize 等
    /// 这个方法给子类设置 tableView 的 样式 ，frame pageSize 等
    func prepareTableView() {}

    // MARK: - 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
    /// 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
    func optimizeMethod() {}


}
