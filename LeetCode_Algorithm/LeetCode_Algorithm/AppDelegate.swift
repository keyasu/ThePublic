//
//  AppDelegate.swift
//  LeetCode_Algorithm
//
//  Created by douhuo on 2021/4/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let vc = ViewController()
        let nav = UINavigationController.init(rootViewController: vc)
        
        window? = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        
        return true
    }

    
    
    
}

