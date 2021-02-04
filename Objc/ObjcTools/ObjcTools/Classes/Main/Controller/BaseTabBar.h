//
//  BaseTabBar.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBar : UITabBar

//中间的 view
@property (nonatomic, strong) UIButton *liveViewBtn ;
 
//直播按钮的点击事件
- (void)liveImgAction;

///当前小蓝点的位置
@property (nonatomic, assign) NSInteger curLocation;


@end

NS_ASSUME_NONNULL_END
