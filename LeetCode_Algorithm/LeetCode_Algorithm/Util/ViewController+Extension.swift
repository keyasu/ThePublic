//
//  ViewController+Extension.swift
//  LeetCode_Algorithm
//
//  Created by douhuo on 2021/4/28.
//

import UIKit

extension UIViewController {
    ///跳转到
    func pushTo(_ viewController: UIViewController) {
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    ///返回上一级
    func popViewController(_ animated:Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
    ///返回根视图
    func popToRootController(_ animated:Bool = true) {
        self.navigationController?.popToRootViewController(animated: animated)
    }
    //dismiss Self
    func dismiss(_ animated: Bool = true,  completion: (() -> Void)? = nil) {
        self.dismiss(animated: animated, completion: completion)
        
    }
}
