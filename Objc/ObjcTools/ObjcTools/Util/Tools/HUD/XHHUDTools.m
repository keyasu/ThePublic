//
//  XHHUDTools.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHHUDTools.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface XHHUDTools ()

@end

@implementation XHHUDTools

+ (XHHUDTools *)hudHepler
{
    static XHHUDTools *hudHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hudHelper = [[XHHUDTools alloc] init];
    });
    return hudHelper;
}

/// 展示 短提示 2s 在 window 上面展示
- (void)showShortTips:(NSString*)message InView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.margin = 5.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2];
}


- (void)showShortTips:(NSString*)message
{
    if ([message isBlankString]) {
        return;
    }
    [self showShortTips:message afterDelay:1.5];
}


- (void)showShortTips:(NSString*)message afterDelay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[AppDelegate appDelegate].window animated:YES];
    
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithHex:0x333333];
            
    hud.label.textColor = [UIColor colorWithHex:0xFFFFFF];
    hud.label.text = message;
    hud.label.numberOfLines = 0;
    
    [hud hideAnimated:YES afterDelay:delay];
    
}


-(void)showTips:(UIView*)view tips:(NSString*)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.margin = 5.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:3];
}






@end
