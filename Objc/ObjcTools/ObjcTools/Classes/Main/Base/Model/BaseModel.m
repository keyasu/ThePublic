//
//  BaseModel.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


//MARK: 将数据映射到对应的类型中
/*
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"eats" : [YYEatModel class]};
}
*/

//MARK: 映射可以设定多个映射字段
/*
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


//MARK: 当 Model 转为 JSON 完成后，该方法会被调用。
/*
// 当 Model 转为 JSON 完成后，该方法会被调用。
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
    return YES;
}
*/

//MARK: 将空字符串转为 @""
// 当 JSON 转为 Model 完成后，该方法会被调用。
// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
// 你也可以在这里做一些自动转换不能完成的工作。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    //处理字符串为null 改为@""，并处理时间字符串
    for (NSString * key in [self bk_properties_string]) {
          if ([self valueForKey:key]==nil || [[NSString stringWithFormat:@"%@", [self valueForKey:key]] isBlankString]) {
             // NSLog(@"-----------------");
              //如果model中有模型的值为空的话, 默认写为空字符串 ""
              [self setValue:@"" forKey:key];
          }else{
//              @try {
//                NSString *dateString =  [NSDate stringChangeFormDateWithTimeString:[self valueForKey:key] withTimeFormat:@"yyyyMMddHHmmss" Format:@"yyyy-MM-dd HH:mm:ss"];
//                  if ([dateString isNotEmpty]) {
//                      [self setValue:dateString forKey:key];
//                  }
//              } @catch (NSException *exception) {
//
//              } @finally {
//
//              }
          }
        
    }
    return YES;
}

//返回类型为NSString的成员变量
-(NSArray *)bk_properties_string{
    // 获取所有的成员变量
    unsigned int count = 0;// 记录属性个数
    Ivar * varList = class_copyIvarList([self class], &count);
    // 遍历
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i<count; ++i) {
        Ivar ivar = varList[i];
        NSString *ivarname = [NSString stringWithUTF8String:ivar_getName(ivar)];
        if ([ivarname hasPrefix:@"_"]) {
            //把 _ 去掉，读取后面的
            ivarname = [ivarname substringFromIndex:1];
        }
        //2.获取成员变量类型
        NSString * ivartype = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        //把包含 @\" 的去掉，如 "@\"nsstring\"";-="">
        NSString * ivarType = [ivartype stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"@\""]];
        
//        NSLog(@"ivarType=%@,ivarname=%@",[self typeWithIvarType:ivarType],ivarname);
         //3.获取类型为NSString的成员变量，加到数组进行返回
        if ([[self typeWithIvarType:ivarType] isEqualToString:@"NSString"]) {
            [mArray addObject:ivarname];
        }
    }
    return mArray;
}

//数据类型判断
-(NSString*)typeWithIvarType:(NSString*)ivarType{
    NSString * typeString = @"";
    if(![ivarType isKindOfClass:[NSString class]]){
        return typeString;
    }
    if([ivarType isEqualToString:@"i"]){
        typeString = @"int";
    }else if([ivarType isEqualToString:@"f"]){
        typeString = @"float";
    }else if([ivarType isEqualToString:@"d"]){
        typeString = @"double|CGFloat";
    }else if([ivarType isEqualToString:@"q"]){
        typeString = @"NSInteger";
    }else if([ivarType isEqualToString:@"B"]){
        typeString = @"BOOL";
    }else{
        typeString = ivarType;
    }
    return typeString;
    
}




@end
