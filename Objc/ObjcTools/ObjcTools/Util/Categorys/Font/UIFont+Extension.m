//
//  UIFont+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)


+ (UIFont *)NFontSize:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:kNewWidth(fontSize)];
}
+ (UIFont *)NBFontSize:(CGFloat)fontSize {
    return [UIFont boldSystemFontOfSize:kNewWidth(fontSize)];
}

+ (UIFont *)NLFontSize:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:kNewWidth(fontSize) weight:UIFontWeightLight];
}
+ (UIFont *)NSBFontSize:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:kNewWidth(fontSize) weight:UIFontWeightSemibold];
}

// 设置 MediumFont
+ (UIFont *)fontWith_medium_fontSize:(CGFloat)size {
    UIFont * font = [UIFont systemFontOfSize:kNewWidth(size) weight:UIFontWeightMedium];
    return font;
}


+ (UIFont *)fontWith_DINAlternateFont_fontSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"DIN Alternate" size:kNewWidth(fontSize)];
}
+ (UIFont *)fontWith_DINAlternateFont_Bold_fontSize:(CGFloat)fontSize {
    return [UIFont fontWithName:@"DINAlternate-Bold" size:kNewWidth(fontSize)];
}


@end
