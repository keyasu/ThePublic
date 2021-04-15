//
//  XHBroadcastPickerViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/3/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHBroadcastPickerViewController.h"
#import <ReplayKit/ReplayKit.h>

#define TAG_SHARESCREEN 7789

API_AVAILABLE(ios(12.0))
@interface XHBroadcastPickerViewController ()
/// <#desc#>
@property (nonatomic, strong) RPSystemBroadcastPickerView *broadPickerView;

@end

@implementation XHBroadcastPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.orangeColor;
    
    if (@available(iOS 12.0, *)) {
        _broadPickerView = [[RPSystemBroadcastPickerView alloc] initWithFrame:CGRectMake(20, 5, 200, 200)];
        _broadPickerView.preferredExtension = @"com.doulanlive.doulan.Broadcast";
        
        _broadPickerView.showsMicrophoneButton = NO;
    //    [self.view addSubview:_broadPickerView];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 300, 40)];
        [button setTitle:@"点我就好了" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickedOnStartRecordButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.tag = TAG_SHARESCREEN;
        [self.view addSubview:button];
        
    } else {
        // Fallback on earlier versions
    }
    
    
}



- (void)clickedOnStartRecordButton:(UIButton *)sender
{
    if (sender.tag == TAG_SHARESCREEN)
        {
            for (UIView *view in _broadPickerView.subviews)
            {
                if ([view isKindOfClass:[UIButton class]])
                {
                    //调起录像方法，UIControlEventTouchUpInside的方法看其他文章用的是UIControlEventTouchDown，
                    //我使用时用UIControlEventTouchUpInside用好使，看个人情况决定
                    [(UIButton *)view sendActionsForControlEvents:UIControlEventTouchUpInside];
                }
            }
        }
}


@end
