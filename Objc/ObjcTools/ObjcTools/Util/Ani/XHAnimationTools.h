//
//  XHAnimationTools.h
//  ObjcTools
//
//  Created by douhuo on 2021/3/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN


@interface XHAnimationTools : NSObject

/** 单行文本长度计算 */
+(CGSize)sizeWithString:(NSString *)string andFont:(UIFont *)font;

/** 多行计算frame */
+(CGRect)rectWithString:(NSString *)string andFont:(UIFont *)font maxWidth:(CGFloat)width;


/** 根据色值获取图片 */
+(UIImage*)getImgWithColor:(UIColor *)color;

/** 设置上图下文字 */
+(UIButton*)setUpImgDownText:(UIButton *)btn;

/** 自定义间距上图下文字 */
+(UIButton*)setUpImgDownText:(UIButton *)btn space:(CGFloat)space;


/** 根据图片名拼接文件路径 */
+(NSString *)getFilePathWithImageName:(NSString *)imageName;

/** 判断是不是本地视频 */
+(BOOL)judgeAssetisInLocalAblum:(PHAsset *)asset;

/** 权限相关 */
+(BOOL)havePhotoLibraryAuthority;

/** 原图-小-恢复 */
+(CAAnimation*)bigToSmallRecovery;

/** 原图-大-小*/
+(CAAnimation*)smallToBigToSmall;

/** 原图-小-保持 */
+(CAAnimation*)originToSmall;

/** 原图-大-小-恢复 */
+(CAAnimation*)originToBigToSmallRecovery;

/* 观看页面上下切换，并且未关注的情况下的过渡动画 */
+(CAAnimation*)followShowTransition;

/** 按钮按下执行动画(录音) */
+(CAAnimation*)touchDownAnimation;

/** 旋转动画 */
+(CABasicAnimation*)rotationAnimation;

/** 动画组 */
+(CAAnimationGroup*)caGroup;

/** MD5 */
+(NSString *)stringToMD5:(NSString *)str;


/**
 获取icon

 @return    icon
 */
+(UIImage *)getAppIcon;
@end

NS_ASSUME_NONNULL_END
