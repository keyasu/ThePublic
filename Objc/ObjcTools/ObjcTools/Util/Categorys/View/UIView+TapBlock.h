//
//  UIView+TapBlock.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/23.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (TapBlock)

- (void)xh_Tapped:(void(^)(void))tappBlock;

@end

NS_ASSUME_NONNULL_END
