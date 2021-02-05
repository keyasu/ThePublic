//
//  BaseModel.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject
/**
 * 所有的数据都是继承这个, 出来的全部是字符串, 然后根据需要再次转换
 *
 */

/// 可以在 model 进行一下操作的  目前的主要功能 将空字符串转为 ""
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic;



 
/*
// 当 JSON 转为 Model 完成后，该方法会被调用。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    // 可以在这里处理一些数据逻辑，如NSDate格式的转换
    
    _gender = [NSString stringWithFormat:@"1234567890"];
    
    
    return YES;
}
*/
/*
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"eats" : [YYEatModel class]};
}
*/

/*
 //字段映射使用到的
+ (NSDictionary *)modelCustomPropertyMapper {
    // 将personId映射到key为id的数据字段
    return @{
             @"personId":@"id",
             @"sex":@"sexDic.sex" // 声明sex字段在sexDic下的sex
             };
    // 映射可以设定多个映射字段
    //  return @{@"personId":@[@"id",@"uid",@"ID"]};
}
*/


/*
// 当 Model 转为 JSON 完成后，该方法会被调用。 - 这个一般使用不到
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
    return YES;
}
*/

@end

NS_ASSUME_NONNULL_END
