//
//  AppDelegate.m
//  ObjcTools
//
//  Created by wangergang on 2021/2/2.
//

#import "AppDelegate.h"
#import "WEGExcessiveViewController.h"
#import "AppDelegate+Extension.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
        
    [self toRootVC];
        
    [self setUserDefalueData];
    
    return YES;
}

//MARK: 设置过度的文件
- (void)toRootVC
{
    WEGExcessiveViewController * vc = [[WEGExcessiveViewController alloc] init];
    self.window.rootViewController = vc;
    
    // 显示出来
    [self.window makeKeyAndVisible];
    
}

#pragma mark -------------------- 初始化AppDelegate ------------------------
+ (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
