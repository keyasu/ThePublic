//
//  JPushInstance.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <JPush/JPUSHService.h>

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/**
 * 处理通知事件, 通知使用 极光推送
 * 下面是集成文档
 * http://docs.jiguang.cn/jpush/client/iOS/ios_guide_new/
 *
 */

@interface JPushInstance : NSObject
<
    JPUSHRegisterDelegate,
    JPUSHGeofenceDelegate
>

+ (instancetype)instance ;

#pragma mark - 常用方法
/// 设置user_id为别名以及tag
- (void)setUserIdToAlias;

/// 删除设置的tag和别名
- (void)deleteAliasForUser;

#pragma mark - 官方方法

/// 增加新的tag
- (void)addTagsWith:(NSArray *)tags;

/// 覆盖设置所有的tag
- (void)setTagsWith:(NSArray *)tags;

/// 获得所有的tag
- (void)getAllTags;

/// 删除tag
- (void)deleteTagsWithArr:(NSArray *)tags;


/// 增加别名
- (void)setAliasWithAlias:(NSString *)alias;

/// 删除别名
- (void)deleteAliasWithAlias:(NSString *)alias;

/// 检查alias，如果为空或者和当前userID不一致，就替换成新的
- (void)checkAlias;



@end

NS_ASSUME_NONNULL_END
