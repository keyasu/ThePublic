//
//  UIButton+Action.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Action)


- (void)touchUpInside:(void (^)(void))actionBlock;
- (instancetype)touchUpInsideAction:(void (^)(void))actionBlock;


@end

NS_ASSUME_NONNULL_END
