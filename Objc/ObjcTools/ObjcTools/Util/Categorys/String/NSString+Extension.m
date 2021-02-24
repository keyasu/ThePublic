//
//  NSString+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (NSURL *)transToUrl {
    return [[NSURL alloc] initWithString:self];
}
- (BOOL)isUrl {
    if ([self hasPrefix:@"http://"] || [self hasPrefix:@"https://"]) {
        return YES;
    }
    return NO;
}
/**
 是不是空字符串

 @return <#return value description#>
 */
- (BOOL)isBlankString
{
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([self isEqualToString:@"(null)"] ||
        [self isEqualToString:@"（null）"] ||
        [self isEqualToString:@"(null)"] ||
        [self isEqualToString:@"null"] ||
        [self isEqualToString:@"<null>"])
    {
        return YES;
    }
    
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    if (self.length == 0) {
        return YES;
    }
    return NO;
}

//MARK: -  字符串后面拼接数据
- (NSString *)append:(NSString *)str {
    NSString * re = [NSString stringWithFormat:@"%@%@", self, str];
    return re;
}
- (BOOL)canOpenWithApplication {
    if ([[UIApplication sharedApplication] canOpenURL:[self transToUrl]]) {
        return YES;
    }
    return NO;
}
- (void)openWithApplication {
    if ([[UIApplication sharedApplication] canOpenURL:[self transToUrl]]) {
        
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:[self transToUrl]
                                               options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@NO}
                                     completionHandler:^(BOOL success) {
                
                NSLog(@"Safari 去打开该链接");
                
            }];
        }else {
            [[UIApplication sharedApplication] openURL:[self transToUrl]];
        }
    }
}
- (void)openPhoneWithApplication {
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@", self];
    
    [str openWithApplication];
}


@end
