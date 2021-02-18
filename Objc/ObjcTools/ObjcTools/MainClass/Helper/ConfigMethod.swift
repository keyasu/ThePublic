//
//  ConfigMethod.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

// MARK: - 弹框的显示
/**
 *  弹框的显示
 */
func showMsg(_ msg: String) {
    if msg.count > 0 {
        appWindow().makeToast(msg,duration:1.5, position: ToastPosition.center)
    }
    
}
/**
 *  这个屏幕
 */
func appwindowBounds() -> CGRect{
    return appw?.bounds ?? CGRect.init(x: 0, y: 0, width: SRNW, height: SRNH)
}
/**
 *  获取 window
 */
func appWindow() -> UIWindow {
    return appw ?? UIApplication.shared.keyWindow!
}


/** 信息打印 */
func PrintLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {

//    #if DEBUG
//
//    debugPrint("=======================================================")
//    debugPrint("file    >>>    \((file as NSString).lastPathComponent)    <<<")
//    debugPrint("METHOD: >>>    \(method)    <<<")
//    debugPrint("LINE:   >>>    \(line)    <<<")
//    debugPrint("打印信息--> Message:")
//    debugPrint(message)
//    debugPrint("<--打印信息")
//    debugPrint("Time:   >>> 时间:时间戳(13位):\(Date().currentMilliStamp) <<<")
//    debugPrint("Time:   >>> 时间:\("\(Date().currentTimeStamp)".transformTimestamptoDate("yyyy-MM-dd HH:mm:ss EEE")) <<<")
//    #endif
    #if DEBUG
    print("""
        =======================================================
        file  :\((file as NSString).lastPathComponent)
        METHOD:\(method)
        LINE  :\(line)
        打印信息--> Message:
        \(message)
        <--打印信息
        Time:时间戳(13位):\(Date().currentMilliStamp)
        Time:\("\(Date().currentTimeStamp)".transformTimestamptoDate("yyyy-MM-dd HH:mm:ss EEE"))
        =======================================================
        """)
    #endif
    
}

// MARK: - 获取当前显示的控制器
func getCurrentVC() -> UIViewController? {
    var currVC: UIViewController? = nil
    var rootVC: UIViewController? = appWindow().rootViewController
    repeat {
        if (rootVC is UINavigationController) {
            let nav = rootVC as? UINavigationController
            let v: UIViewController? = nav?.viewControllers.last
            currVC = v
            rootVC = v?.presentedViewController
            continue
        } else if (rootVC is UITabBarController) {
            let tabVC = rootVC as? UITabBarController
            currVC = tabVC
            rootVC = tabVC?.viewControllers?[tabVC?.selectedIndex ?? 0]
            continue
        }else if (rootVC is UIViewController) {
            currVC = rootVC
            break
        }
    } while rootVC != nil
    return currVC
    
}
