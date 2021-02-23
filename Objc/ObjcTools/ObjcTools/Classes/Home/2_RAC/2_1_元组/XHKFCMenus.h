//
//  XHKFCMenus.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/23.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHKFCMenus : NSObject


@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *icon;

+(instancetype)KFCWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
