//
//  XHConfig.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//


// MARK: - double类型width
/// - double类型width
let ScreenWidth:Double=Double(UIScreen.main.bounds.size.width)
// MARK: - double类型height
/// - double类型height
let ScreenHeight:Double=Double(UIScreen.main.bounds.size.height)
// MARK: - cgfloat类型width
/// - cgfloat类型width
let SRNW:CGFloat = UIScreen.main.bounds.size.width
// MARK: - cgfloat类型height
/// - cgfloat类型height
let SRNH:CGFloat = UIScreen.main.bounds.size.height

/// MARK: - Key window
let appw = UIApplication.shared.keyWindow

// MARK: - statusBar高度
//SRNW == 375 && SRNH == 812
/// statusBar高度
let StatusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.size.height
// MARK: - 简单的判断
/// - 简单的判断
let isiPhoneX: Bool = (StatusBarHeight != 20)
let safeToBottom: CGFloat = isiPhoneX ? 34:0

// 导航栏下面x到顶部的距离
let SafeWithNavToTop : CGFloat = StatusBarHeight + 44.0
// MARK: - navBar高度
/// navBar高度
let NavBarHeight:CGFloat = 44.0
// MARK: - 判断状态栏高度
/// 判断状态栏高度
let SStatusBarHeight:CGFloat = isiPhoneX ? NavBarHeight : StatusBarHeight
// MARK: - tabBar高度
/// tabBar高度
let TabBarHeight:CGFloat = (StatusBarHeight != 20) ? 83.0 : 49.0
// MARK: - 安全区（包含statusbar）高度
/// - 安全区（包含statusbar）高度
let SafeAndStatusBarHeight = 44.0
// MARK: - 安全区（包含tabbar）高度
/// - - 安全区（包含tabbar）高度
let SafeAndTabBarHeight = 83.0
// MARK: - 安全区加navbar高度
/// - - 安全区加navbar高度
let SafeAndStatusBarAndNavHeight = 88.0
// MARK: - 获取根导航控制器
/// - - 获取根导航控制器
let appNavc = appWindow().rootViewController?.children.first as! UINavigationController

/** 当前 app 当前版本 */
let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
/** 获取 build 版本 , 这个用不到了*/
let verCodes: String =  Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
/** 读取之后 每次升级之后修改 */
let verCode: String =  Bundle.main.infoDictionary?["vercode"] as? String ?? "1"




let holderImgStr: String = "live"
let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? "抖蓝"

