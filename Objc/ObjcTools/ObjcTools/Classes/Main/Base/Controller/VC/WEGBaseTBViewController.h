//
//  WEGBaseTBViewController.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGBaseScrollViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WEGBaseTBViewController : WEGBaseScrollViewController
<
    UITableViewDelegate,
    UITableViewDataSource
>

 
/**
 *  UITableView
 */
@property (nonatomic, strong) UITableView *tablev ;
/**
 数据加载类型
 */
@property (nonatomic ,assign) TVloadType tvloadType;

/**
 * UITableView 的 frame
 */
@property (nonatomic, assign) CGRect tvRect ;
/*
 *
 */
@property (nonatomic, assign) CGFloat contentInsetTop ;

@end

NS_ASSUME_NONNULL_END
