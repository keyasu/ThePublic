//
//  BaseWebViewModel.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "BaseWebViewModel.h"


@implementation BaseWebViewModel

+ (instancetype)shareModel {
    static BaseWebViewModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[BaseWebViewModel alloc] init];
    });
    return model;
}

- (NSDictionary *)getDataWithLoadType:(WebViewLoadType)loadType
{
    NSString *titleStr = @"", *urlStr = @"";
    switch (loadType) {
        case WebViewLoadTypeGongYue:
        {// 社会公寓
            titleStr = @"社区公约";
            urlStr = @"https://www.baidu.com/";
        }
            break;
        case WebViewLoadTypeZhengce:
        {// 隐私政策
            titleStr = @"隐私政策";
            urlStr = @"https://www.baidu.com/";
        }
            break;
        
        default:
        {
            //    WebViewLoadTypeUnknown = 1, // 未知\
            
        }
         
            break;
    }
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:
                          titleStr, @"titleStr",
                          urlStr, @"urlStr",
                          nil];
    
    return dic;
}

@end
