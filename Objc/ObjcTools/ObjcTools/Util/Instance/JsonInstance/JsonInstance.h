//
//  JsonInstance.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonInstance : NSObject

+ (instancetype)instance ;

/// 读取本地JSON文件 - 数组
- (NSArray *)readJsonArrayWithFileName:(NSString *)fileName ;
/// 读取本地JSON文件 - 字典
- (NSDictionary *)readJsonDictionaryWithFileName:(NSString *)fileName ;
@end

NS_ASSUME_NONNULL_END
