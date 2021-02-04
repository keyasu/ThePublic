//
//  WEGBaseTBCell.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WEGBaseTBCell : UITableViewCell

/**
 添加子控件
 */
- (void)setupUI ;

/**
 布局 View 的
 */
- (void)prepareView ;


/**
 cell 重用标志符

 @return 标识符
 */
+ (NSString *)cellReuseIdentifier ;



@end

NS_ASSUME_NONNULL_END
