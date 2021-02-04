//
//  NSDictionary+SafeObject.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SafeObject)
//判断字符串
-(id)SafeObject:(NSString *)keyname;

@end


@interface NSMutableDictionary (NilSafe)

@end

@interface NSNull (NilSafe)

@end


NS_ASSUME_NONNULL_END
