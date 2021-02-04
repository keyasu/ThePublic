//
//  UIImageView+Extension.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Extension)


/// 初始化 image view
+ (UIImageView *)viewWithImageName:(NSString *)imageName;

+ (UIImageView *)viewWithImageName:(NSString *)imageName
                      CornerRadius:(CGFloat)cornerRadius;

+ (UIImageView *)viewWithImageName:(NSString *)imageName
                      CornerRadius:(CGFloat)cornerRadius
                       ContentMode:(UIViewContentMode)contentMode;
/// 初始化 with 图片
+ (UIImageView *)viewWithImage:(UIImage *)image ;

/**
 设置图片

 @param imageName 默认图片 iamge
 */
- (void)setImageWith:(NSString *)imageName ;
- (void)setImageWithURL:(NSURL *)imageUrl ;
/**
 设置b图片

 @param imageName 图片的名字, 字符串
 @param holderImage 默认图, uiimage
 */
- (void)setImageWith:(NSString *)imageName withPlaceholder:(nullable UIImage *)holderImage ;
- (void)setImageWithURL:(NSURL *)imageUrl withPlaceholder:(nullable UIImage *)holderImage ;


@end

NS_ASSUME_NONNULL_END
