//
//  UIView+Animation.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)


- (void)zoomAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:1.3];
    animation.duration = 0.8;
    animation.autoreverses = NO;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:@"zoom"];
}
- (void)scaleAnimationFromValue:(NSNumber *)fromValue
                        ToValue:(NSNumber *)toValue
                       duration:(CFTimeInterval)duration
                   autoreverses:(BOOL)autoreverses
                    repeatCount:(float)repeatCount
            removedOnCompletion:(BOOL)removedOnCompletion
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.duration = duration;
    animation.autoreverses = autoreverses;
    animation.repeatCount = repeatCount;
    animation.removedOnCompletion = removedOnCompletion;
    animation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:@"zoom"];

}

+ (NSArray *)getImageFromGifResource:(NSString *)resource
{
    
    NSMutableArray *imageArray = [NSMutableArray array];
    
    // 获取gif url
    NSURL *url = [[NSBundle mainBundle] URLForResource:resource withExtension:@"gif"];
    // 转换为图片源
    CGImageSourceRef gifImageSourceRef = CGImageSourceCreateWithURL((CFURLRef)url, nil);
    // 获取图片个数
    size_t framesCount = CGImageSourceGetCount(gifImageSourceRef);
    for (size_t i=0; i<framesCount; i++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(gifImageSourceRef, i, nil);
        UIImage *image = [[UIImage imageWithCGImage:imageRef] rescaleImageToSize:CGSizeMake(kNewWidth(30), kNewHeight(30))];
        
        
        
        [imageArray addObject:image];
        
        CFRelease(imageRef);
    }
    
    return imageArray;
}




@end
