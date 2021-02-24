//
//  NSString+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)

- (NSURL *)transToUrl;

- (BOOL)isUrl;
/**
 是不是空字符串

 @return 后台使用 PHP 写的, 返回多数情况下会有 <null> (null) 等情况, 直接在这里进行为空判断
 */
- (BOOL)isBlankString;
//MARK: -  字符串后面拼接数据
- (NSString *)append:(NSString *)str;

/// 能用浏览器打开
- (BOOL)canOpenWithApplication ;
/// 系统浏览器打开
- (void)openWithApplication;
/// 拨打电话
- (void)openPhoneWithApplication ;






@end

NS_ASSUME_NONNULL_END
