//
//  UITableView+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Extension)
/**
 注册 cell

 @param cellClass 注册 cell
 */
- (void)registerFromClass:(nullable Class)cellClass ;


/**
 注册 header footer view

 @param cellClass 注册 header footer view
 */
- (void)registerHeaderFooterViewFromClass:(nullable Class)cellClass ;


@end

NS_ASSUME_NONNULL_END
