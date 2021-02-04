//
//  XHProtocolResolver.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHProtocolResolver.h"
#import "BaseTabBarController.h"

@implementation XHProtocolResolver

/// instance
+ (instancetype)shareInstace {
    static XHProtocolResolver *shareInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstace = [[XHProtocolResolver alloc] init];
    });
    return shareInstace;
}
///去 tabber 页面
- (void)toDefaultTaBbarController {
    
    //1.10 切换账号再次登录的时候链接聊天xmpp
    // 连接私信
    
    //登录成功, 则绑定
    //[[XGPushInstance instance] setAccountSettings];
    
    // 登录成功，设置极光
    [[JPushInstance instance] setUserIdToAlias];
    
    //删除其他的一下缓存的数据
    
    // 创建tabbarController
    BaseTabBarController * tabBarVC = [[BaseTabBarController alloc] init];
    // 设置跟控制器
    [AppDelegate appDelegate].window.rootViewController = tabBarVC;
    
    
}

@end
