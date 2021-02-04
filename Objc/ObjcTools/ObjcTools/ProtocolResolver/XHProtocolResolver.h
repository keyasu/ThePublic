//
//  XHProtocolResolver.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHProtocolResolver : NSObject

/// instance
+ (instancetype)shareInstace ;

///去 tabber 页面
- (void)toDefaultTaBbarController;

@end

NS_ASSUME_NONNULL_END
