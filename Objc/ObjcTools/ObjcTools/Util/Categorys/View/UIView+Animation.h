//
//  UIView+Animation.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Animation)

- (void)scaleAnimationFromValue:(NSNumber *)fromValue
                        ToValue:(NSNumber *)toValue
                       duration:(CFTimeInterval)duration
                   autoreverses:(BOOL)autoreverses
                    repeatCount:(float)repeatCount
            removedOnCompletion:(BOOL)removedOnCompletion;

+ (NSArray *)getImageFromGifResource:(NSString *)resource;


@end

NS_ASSUME_NONNULL_END
