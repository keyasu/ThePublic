//
//  JsonInstance.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "JsonInstance.h"


@implementation JsonInstance

+ (instancetype)instance {
    static JsonInstance * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JsonInstance alloc] init];
    });
    return instance;
}

  
// 读取本地JSON文件
- (NSArray *)readJsonArrayWithFileName:(NSString *)fileName {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (NSDictionary *)readJsonDictionaryWithFileName:(NSString *)fileName {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    return dic;
}


@end
