//
//  Config.swift
//  LeetCode_Algorithm
//
//  Created by douhuo on 2021/4/27.
//

import UIKit

// MARK: - cgfloat类型width
/// - cgfloat类型width
let SRNW:CGFloat = UIScreen.main.bounds.size.width
// MARK: - cgfloat类型height
/// - cgfloat类型height
let SRNH:CGFloat = UIScreen.main.bounds.size.height

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
