//
//  UIView+TapBlock.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/23.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UIView+TapBlock.h"
#import <objc/runtime.h>

typedef void(^TapBlock)(void); //声明类型

@interface UIView ()

@property (nonatomic,copy) TapBlock TapBlock; //点击按钮

@end

@implementation UIView (TapBlock)

//static char KUIViewPropertyTap = "KUIViewPropertyTap";
static void *KUIViewPropertyTap = &KUIViewPropertyTap;


- (void)setTapBlock:(TapBlock)TapBlock
{
    objc_setAssociatedObject(self, &KUIViewPropertyTap, TapBlock, OBJC_ASSOCIATION_COPY);
}

-(TapBlock)TapBlock{
   return  objc_getAssociatedObject(self, &KUIViewPropertyTap);
}

- (void)xh_Tapped:(void(^)(void))tappBlock
{
    self.TapBlock = tappBlock;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    [self addGestureRecognizer:tapGesture];
    
}

// 单击view
- (void)viewTapped {
    self.TapBlock?self.TapBlock():nil;
}
@end
