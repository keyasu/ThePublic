//
//  JPushInstance.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "JPushInstance.h"


@interface JPushInstance ()

@end

@implementation JPushInstance

static NSInteger seq = 0;

+ (instancetype)instance {
    static JPushInstance *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JPushInstance alloc] init];
    });
    return instance;
}


#pragma mark - Tag
/// 增加tag集合
- (void)addTagsWith:(NSArray *)tags {
    [JPUSHService addTags:[self getTags:tags] completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
      [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
    } seq:[self seq]];
}

/// 覆盖tag集合 调用该接口会覆盖用户所有的tags
- (void)setTagsWith:(NSArray *)tags {
    [JPUSHService setTags:[self getTags:tags] completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
      [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
    } seq:[self seq]];
}
/// 获取所有tag
- (void)getAllTags {
    [JPUSHService getAllTags:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
      [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
    } seq:[self seq]];
}

/// 删除指定tag
- (void)deleteTagsWithArr:(NSArray *)tags {
    [JPUSHService deleteTags:[self getTags:tags] completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
        [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
    } seq:[self seq]];
}

#pragma mark - Alias
/// 增加别名
- (void)setAliasWithAlias:(NSString *)alias {
    [JPUSHService setAlias:alias completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        [self inputResponseCode:iResCode content:iAlias andSeq:seq];
    } seq:[self seq]];
}

/// 删除别名
- (void)deleteAliasWithAlias:(NSString *)alias {
    [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        [self inputResponseCode:iResCode content:iAlias andSeq:seq];
    } seq:[self seq]];
}

/// 检查alias，如果为空或者和当前userID不一致，就替换成新的
- (void)checkAlias {
    [JPUSHService getAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        // 如果为空或者不一致就替换
        NSString * userid = @"userid";
        if ([iAlias isBlankString] || ![iAlias isEqualToString:userid]) {
            [self setUserIdToAlias];
        }
        [self inputResponseCode:iResCode content:iAlias andSeq:seq];
    } seq:[self seq]];
}

#pragma mark - User登录和退出相关操作
/// 设置user_id为别名以及tag
- (void)setUserIdToAlias {
//    [self setTagsWith:@[[UserData getUserData].user.userid]];
    NSString * userid = @"userid";
    [self setAliasWithAlias:userid];
}

/// 删除设置的tag和别名
- (void)deleteAliasForUser {
//    [self deleteTagsWithArr:@[[UserData getUserData].user.userid]];
    NSString * userid = @"userid";
    [self deleteAliasWithAlias:userid];
}
#pragma mark - Tools
/// 数组转化成NSSet
- (NSSet<NSString *> *)getTags:(NSArray *)allTags {
    NSMutableSet * tags = [[NSMutableSet alloc] init];
    [tags addObjectsFromArray:allTags];
    //过滤掉无效的tag
    NSSet *newTags = [JPUSHService filterValidTags:tags];
    return newTags;
}
/// 序列号
- (NSInteger)seq {
  return ++ seq;
}
- (void)inputResponseCode:(NSInteger)code content:(NSString *)content andSeq:(NSInteger)seq{
//    DLog(@"\n\n code:%ld content:%@ seq:%ld", code, content, seq);
}

//MARK: -  JPUSHRegisterDelegate
/*
 * @brief handle UserNotifications.framework [willPresentNotification:withCompletionHandler:]
 * @param center [UNUserNotificationCenter currentNotificationCenter] 新特性用户通知中心
 * @param notification 前台得到的的通知对象
 * @param completionHandler 该callback中的options 请使用UNNotificationPresentationOptions
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger options))completionHandler {
//    NSLog(@"");
    
//    DLog(@"%@-----------------------------", notification);
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}
/*
 * @brief handle UserNotifications.framework [didReceiveNotificationResponse:withCompletionHandler:]
 * @param center [UNUserNotificationCenter currentNotificationCenter] 新特性用户通知中心
 * @param response 通知响应对象
 * @param completionHandler
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
//    NSLog(@"");
    
//    DLog(@"%@-----------------------------",response);
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

/*
 * @brief handle UserNotifications.framework [openSettingsForNotification:]
 * @param center [UNUserNotificationCenter currentNotificationCenter] 新特性用户通知中心
 * @param notification 当前管理的通知对象
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification NS_AVAILABLE_IOS(12.0) {
//    NSLog(@"");
//
//    DLog(@"%@-----------------------------",notification);
    if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        //从通知界面直接进入应用
    }else{
        //从通知设置界面进入应用
    }
}

/**
 * 监测通知授权状态返回的结果
 * @param status 授权通知状态，详见JPAuthorizationStatus
 * @param info 更多信息，预留参数
 */
- (void)jpushNotificationAuthorization:(JPAuthorizationStatus)status withInfo:(NSDictionary *)info {
//    NSLog(@"");
//
//    DLog(@"%@-----------------------------",info);
}
//MARK: JPUSHGeofenceDelegate

/**
 进入地理围栏区域
 
 @param geofenceId 地理围栏id
 @param userInfo 地理围栏触发时返回的信息
 @param error 错误信息
 */
- (void)jpushGeofenceIdentifer:(NSString *)geofenceId didEnterRegion:(NSDictionary *)userInfo error:(NSError *)error {
//    NSLog(@"");
}

/**
 离开地理围栏区域
 
 @param geofenceId 地理围栏id
 @param userInfo 地理围栏触发时返回的信息
 @param error 错误信息
 */
- (void)jpushGeofenceIdentifer:(NSString *)geofenceId didExitRegion:(NSDictionary *)userInfo error:(NSError *)error {
//    NSLog(@"");
}



@end
