//
//  XHLocalAuthViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHLocalAuthViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface XHLocalAuthViewController ()

@end

@implementation XHLocalAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    UIButton * btn = [[UIButton buttonTitle:@"指纹" TitleColor:UIColor.hex_FFFFFF FontSize:36 CornerRadius:0 BackgroundColor:UIColor.hex_random] touchUpInsideAction:^{
        [self showasd];
    }];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
}

- (void)showasd {
    LAContext *context = [[LAContext alloc] init];
        
    NSError *error = nil;
    NSString * tStr = @"输入指纹进行验证";
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:tStr reply:^(BOOL success, NSError * _Nullable error) {
                
            if (success)
            {
                NSLog(@"验证成功");
            }
            else
            {
                NSLog(@"验证失败");
                /*
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:
                    {
                        //NSLog(@"Authentication was cancelled by the system");
                        //切换到其他APP，系统取消验证Touch ID
                        break;
                    }
                    case LAErrorUserCancel:
                    {
                        //NSLog(@"Authentication was cancelled by the user");
                        //用户取消验证Touch ID
                        break;
                    }
                    case LAErrorUserFallback:
                    {
                        //NSLog(@"User selected to enter custom password");
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            //用户选择其他验证方式，切换主线程处理
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            //其他情况，切换主线程处理
                        }];
                        break;
                    }
                }
                
                */
            }

        }];
    }
    else
    {
        NSLog(@"识别功能不可用");
        /*
        //不支持指纹识别，LOG出错误详情
        NSLog(@"%@",error.localizedDescription);
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        */
        
    }


}




@end
