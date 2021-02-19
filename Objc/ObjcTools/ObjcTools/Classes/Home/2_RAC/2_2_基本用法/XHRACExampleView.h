//
//  XHRACExampleView.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface XHRACExampleView : WEGBaseView

/// 暴露的按钮
@property (nonatomic, strong) UIButton *btn3;

- (void)btn1Action:(NSString *)str;

- (void)btn2Action:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
