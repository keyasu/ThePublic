//
//  ViewController+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentShow(_ toVC: UIViewController, _ completion: (() -> Void)? = nil) {
        
        toVC.definesPresentationContext = true
        toVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        toVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        self.present(toVC, animated: true, completion: completion)
    }
    
    
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
