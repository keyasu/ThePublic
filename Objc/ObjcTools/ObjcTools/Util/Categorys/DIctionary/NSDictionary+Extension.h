//
//  NSDictionary+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 字典json解析
 */
@interface NSDictionary (Extension)

/// 请求数据成功
- (BOOL)isSuccessData ;

/// 账户余额不足
- (BOOL)isBalanceLimit ;
/**
 获取字典的字符串值
 
 @param key 键
 @return 字符串
 */
- (NSString *)stringForKey: (NSString *)key;
/**
 格式化json字符串－－替换特殊字符
 
 @param msg msg
 @return string
 */
+ (NSString *)stringJSONFormat: (NSString *)msg;

/**
 字符串转换为字典
 
 @param jsonString 字符串
 @return 字典
 */
+ (NSDictionary *)toDictionaryWith:(NSString *)jsonString;

/**
 字典转换为字符串
 
 @return json 格式的字符串
 */
- (NSString *)dicToJSONstring;
- (NSString *)toJSONstring;

/*
 字典转换为字符串 - 没有转移字符
 
 @return json 格式的字符串
 */
-(NSString *)toJSONstringNOTransferCharacter;

#pragma mark 遍历
- (void)weg_each:(void (^)(id key, id obj))block;

@end

NS_ASSUME_NONNULL_END
