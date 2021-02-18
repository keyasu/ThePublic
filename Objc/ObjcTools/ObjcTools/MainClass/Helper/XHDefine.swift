//
//  XHDefine.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

//MARK: - 空白的 Closure 定义
typealias VoidClosure = () -> Void
typealias IntClosure = (_ index: Int) -> Void
typealias FloatClosure = (_ float: CGFloat) -> Void
typealias BoolClosure = (_ condition: Bool) -> Void
typealias StringClosure = (_ text: String) -> Void
typealias ImageClosure = (_ image: UIImage) -> Void


//MARK: - 通知名称的定义
/** 键盘将要出现 **/
let keyboardWillShowNotiName = UIResponder.keyboardWillShowNotification

/** 键盘将要隐藏 **/
let keyboardWillHidenNotiName = UIResponder.keyboardWillHideNotification

/** app进入前台 **/
let appWillEnterForeground = UIApplication.didBecomeActiveNotification

let localMyselfInfo = "localMyselfInfo"
