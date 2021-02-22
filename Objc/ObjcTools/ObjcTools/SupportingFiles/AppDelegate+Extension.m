//
//  AppDelegate+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "AppDelegate+Extension.h"
#import <Bugly/Bugly.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
//#import <TXLiteAVSDK_Professional/TXLiveBase.h>
//#import <CL_ShanYanSDK/CL_ShanYanSDK.h>


@implementation AppDelegate (Extension)


- (void)setUserDefalueData {
    ///设置配置数据
    [self setupCustomConfigure];
    /// 设置开发者模式
    [self setAppdeveloperMode];
    /// 设置统计数据
    [self setBuglyData];
    /// 设置键盘全局
    [self setKeyboardManager];
    
    [self setTXLiveLicence];
    
    /// 创蓝初始化（一键登录）
    [self setCLShanyanSDK];
    
    [self demo4];
    
}

- (void)demo4 {

}

//插入排序
- (void)demo3 {
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:@"1", @"12", @"4", @"2", @"123", @"13", @"23", nil];
    
    NSLog(@"排序前 %@ \n", arr);
    
    for (int i = 0; i<arr.count; i++)
    {
        int j = i;
        int temp = [[arr objectAtIndex:i] intValue];
        while (j>0 && temp < [[arr objectAtIndex:j-1] intValue]) {
            [arr replaceObjectAtIndex:j withObject:[arr objectAtIndex:j-1]];
            j--;
        }
        [arr replaceObjectAtIndex:j withObject:[NSNumber numberWithInt:temp]];
        NSLog(@"排序 %d, 排序后 %@", i, arr);
    }
    
    NSLog(@"排序后 %@", arr);
    NSLog(@"结束了");
    
}

//选择排序
- (void)demo2 {
    NSMutableArray * marr = [NSMutableArray arrayWithObjects:@"1", @"12", @"4", @"2", @"123", @"13", @"23", nil];
    
    NSLog(@"排序前 %@ \n", marr);
    
    for (int i = 0; i<marr.count-1; i++)
    {
        for (int j=i+1; j<marr.count; j++)
        {
            if ([marr[i] intValue] > [marr[j] intValue]) {
                int temp = [marr[i] intValue];
                marr[i] = marr[j];
                marr[j] = [NSString stringWithFormat:@"%d", temp];
            }
        }
    }
    NSLog(@"排序后 %@", marr);
    NSLog(@"结束了");
    
}
//冒泡排序
- (void)demo1 {
    NSMutableArray * marr = [NSMutableArray arrayWithObjects:@"1", @"12", @"4", @"2", @"123", @"13", @"23", nil];
    NSLog(@"排序前 %@ \n", marr);
    for (int i = 0; i<marr.count-1; i++) {
        for (int j=0; j<marr.count-1-i; j++) {
            if ([marr[j] intValue] > [marr[j+1] intValue]) {
                int temp = [marr[j] intValue];
                marr[j] = marr[j+1];
                marr[j+1] = [NSString stringWithFormat:@"%d", temp];
                
            }
        }
        
    }
    NSLog(@"排序后 %@", marr);
    NSLog(@"结束了");
}


- (void)setTXLiveLicence {
    /*
    NSString * const licenceURL = TXLive_licenceUrl;
    NSString * const licenceKey = TXLive_keyStr;

    //TXLiveBase 位于 "TXLiveBase.h" 头文件中
    [TXLiveBase setLicenceURL:licenceURL key:licenceKey];
    DLog(@"TXLive SDK Version = %@", [TXLiveBase getSDKVersionStr]);
    */
    
}

/// 创蓝闪验
- (void)setCLShanyanSDK {
    /*
    // 初始化
    [CLShanYanSDKManager initWithAppId:CL_SDK_APPID complete:nil];
    
    // 如果未登录
    if ([[UserData getUserData].user.userid isBlankString]) {
        // 预取号
        [CLShanYanSDKManager preGetPhonenumber:^(CLCompleteResult * _Nonnull completeResult) {
                
        }];
    }
    */
}
- (void)setAppdeveloperMode {
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[DLMeManager sharedDLMeManager] reConfirmWithReceiptComplate:^(BOOL isSuccess) {
//
//        }];
//    });
    
}

- (void)setBuglyData
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleVersion"];
    NSString * usernumber = @"10086";
    
    BuglyConfig *config = [[BuglyConfig alloc] init];
    
    config.unexpectedTerminatingDetectionEnable = YES;
    config.blockMonitorEnable = YES;
    //[config setDeviceIdentifier:usernumber];
    config.deviceIdentifier = usernumber;
    //20200506 原来设置为1s, 检测到的卡顿信息不准确, 有时候接口处理数据都不只 1s 钟, 修改为5s,过一段时间尝试结果看看
    [config setBlockMonitorTimeout:5.0f];
    [config setSymbolicateInProcessEnable:YES];
    config.channel = @"guanfang";
    config.reportLogLevel = BuglyLogLevelError;
    config.version = appVersion;
        
    //
    [Bugly startWithAppId:@"9b2529ca1c" config:config];
    
}

- (void)setKeyboardManager {
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    keyboardManager.enable = YES; // 控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    keyboardManager.shouldToolbarUsesTextFieldTintColor = YES; // 控制键盘上的工具条文字颜色是否用户自定义
    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    keyboardManager.enableAutoToolbar = NO; // 控制是否显示键盘上的工具条
    keyboardManager.shouldShowToolbarPlaceholder = YES; // 是否显示占位文字
    keyboardManager.placeholderFont = [UIFont boldSystemFontOfSize:16]; // 设置占位文字的字体
    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
    
}

/// 系统默认的数据
- (void)setupCustomConfigure {
    
    [GKConfigure setupCustomConfigure:^(GKNavigationBarConfigure *configure) {

        configure.titleColor = UIColor.hex_333333;
        configure.titleFont = [UIFont NFontSize:32.0f];
        configure.backgroundColor = [UIColor whiteColor];
        
        configure.gk_navItemLeftSpace = 4.0f;
        configure.gk_navItemRightSpace = 4.0f;
        configure.backStyle = GKNavigationBarBackStyleBlack;
        
    }];
}



@end
