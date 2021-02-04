//
//  UIImageView+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)


+ (UIImageView *)viewWithImageName:(NSString *)imageName {
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageWithName:imageName]];
    
    iv.contentMode = UIViewContentModeScaleAspectFit;
    
    return iv;
}
+ (UIImageView *)viewWithImageName:(NSString *)imageName
                      CornerRadius:(CGFloat)cornerRadius
{
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageWithName:imageName]];
    
    iv.contentMode = UIViewContentModeScaleAspectFit;
    iv.layer.cornerRadius = kNewWidth(cornerRadius);
    iv.layer.masksToBounds = YES;
    
    return iv;
}
+ (UIImageView *)viewWithImageName:(NSString *)imageName
                      CornerRadius:(CGFloat)cornerRadius
                       ContentMode:(UIViewContentMode)contentMode
{
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageWithName:imageName]];
    
    iv.contentMode = contentMode;
    if (cornerRadius > 0) {
        iv.layer.cornerRadius = kNewWidth(cornerRadius);
        iv.layer.masksToBounds = YES;
    }
    return iv;
}
+ (UIImageView *)viewWithImage:(UIImage *)image {
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    
    return iv;
}


- (void)setImageWith:(NSString *)imageName {
    if ([imageName isBlankString]) {
        [self setImageWithURL:[NSURL URLWithString:@""] withPlaceholder:[UIImage imageWithName:@"live"]];
        
    }else {
        if ([imageName isUrl]) {
            [self setImageWithURL:[imageName transToUrl] withPlaceholder:[UIImage imageWithName:@"live"]];
            
        }else {
            self.image = [UIImage imageWithName:imageName];
        }
    }
}

- (void)setImageWithURL:(NSURL *)imageUrl {
    
    [self setImageWithURL:imageUrl withPlaceholder:[UIImage imageWithName:@"live"]];
}

- (void)setImageWith:(NSString *)imageName withPlaceholder:(nullable UIImage *)holderImage {
    
    [self setImageWithURL:[imageName transToUrl] withPlaceholder:holderImage];
}
- (void)setImageWithURL:(NSURL *)imageUrl withPlaceholder:(nullable UIImage *)holderImage {
    
    [self sd_setImageWithURL:imageUrl placeholderImage:holderImage];
    
}



@end
