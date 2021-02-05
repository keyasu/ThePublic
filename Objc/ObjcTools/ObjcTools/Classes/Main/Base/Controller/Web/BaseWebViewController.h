//
//  BaseWebViewController.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewController : WEGBaseViewController


@property (nonatomic, strong) NSString *url;
//9.14 标题
@property (nonatomic, strong) NSString *titleStr;


/// web view 的加载形式
@property (nonatomic, assign) WebViewLoadType loadType;


@end

NS_ASSUME_NONNULL_END
