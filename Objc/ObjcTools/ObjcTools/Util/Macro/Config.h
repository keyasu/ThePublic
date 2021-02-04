//
//  Config.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
//#define kScreenW MainScreenWidth()
//#define kScreenH MainScreenWidth()

#define isIphoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//TabBar高度
#define kTabBarHeight (kScreenH >= 812.0 ? 83 : 49)
// MARK: - statusBar高度
/// statusBar高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavigationBarHeight (kScreenH >= 812.0 ? 88 : 64)
#define appWindowBounds [AppDelegate appDelegate].window.bounds
#define appWindow [AppDelegate appDelegate].window

#define __weakSelf __weak typeof(self) weakSelf = self
#define __strongSelf __strong typeof(self) strongSelf = weakSelf


//MARK: 获取屏幕真实的宽高 - 横屏或者竖屏
static __inline__ CGFloat MainScreenWidth()
{
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height;
}
static __inline__ CGFloat MainScreenHeight()
{
        return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation) ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width;
}



#endif /* Config_h */
