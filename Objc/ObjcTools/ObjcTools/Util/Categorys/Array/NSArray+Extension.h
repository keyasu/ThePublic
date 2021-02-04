//
//  NSArray+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Extension)

- (NSString *)toJSONString;

#pragma mark 遍历数组
- (void)weg_each:(void (^)(id obj))block;

@end

NS_ASSUME_NONNULL_END
