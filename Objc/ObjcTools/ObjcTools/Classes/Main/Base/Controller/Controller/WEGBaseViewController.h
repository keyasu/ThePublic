//
//  WEGBaseViewController.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WEGBaseViewController : UIViewController


/// 初始化的一些设置在这里给实现了的呢
- (void)setupUI;
///这里的是设置一些导航相关的内容
- (void)setupNavigationUI;

/// 请求网络数据 - 这里存放的是开始网络请求的东西 - 但是在这里不给实现
- (void)requestList;



- (void)setNavTitle:(NSString *)navTitle;


@end

NS_ASSUME_NONNULL_END
