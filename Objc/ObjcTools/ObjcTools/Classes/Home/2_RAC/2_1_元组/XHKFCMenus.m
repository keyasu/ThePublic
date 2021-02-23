//
//  XHKFCMenus.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/23.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHKFCMenus.h"

@implementation XHKFCMenus

+(instancetype)KFCWithDict:(NSDictionary *)dict
{
    XHKFCMenus *kfc = [[XHKFCMenus alloc] init];
    
    [kfc setValuesForKeysWithDictionary:dict];
    
    return kfc;
}

@end
