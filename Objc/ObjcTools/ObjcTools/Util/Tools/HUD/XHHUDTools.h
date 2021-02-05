//
//  XHHUDTools.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHHUDTools : NSObject

+ (XHHUDTools *)tools;

/// 展示 短提示 2s 在 window 上面展示
- (void)showShortTips:(NSString*)message InView:(UIView *)view ;
- (void)showShortTips:(NSString*)message;



@end

NS_ASSUME_NONNULL_END
