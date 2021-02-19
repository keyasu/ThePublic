//
//  XHRACExampleView.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACExampleView.h"

@interface XHRACExampleView ()

/// 内部的按钮
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;


@end

@implementation XHRACExampleView

- (void)setupUI {
    self.btn1 = [UIButton buttonTitle:@"内部按钮" TitleColor:UIColor.hex_FFFFFF FontSize:36 CornerRadius:0 BackgroundColor:UIColor.blueColor];
    self.btn2 = [UIButton buttonTitle:@"内部按钮" TitleColor:UIColor.hex_FFFFFF FontSize:36 CornerRadius:0 BackgroundColor:UIColor.greenColor];
    self.btn3 = [UIButton buttonTitle:@"暴露的按钮" TitleColor:UIColor.hex_FFFFFF FontSize:36 CornerRadius:0 BackgroundColor:UIColor.orangeColor];
        
    [self weg_addSubviews:
     self.btn1,
     self.btn2,
     self.btn3
     , nil];
    
}
- (void)prepareView {
    self.backgroundColor = UIColor.redColor;
    [self.btn1 touchUpInside:^{
        [self btn1Action:@"传递回去的啊"];
    }];
    [self.btn2 addTarget:self action:@selector(btn2Action:) forControlEvents:(UIControlEventTouchUpInside)];
}
- (void)btn2Action:(UIButton *)sender {
    
}
- (void)btn1Action:(NSString *)str {}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(kNewHeight(30));
        make.width.mas_equalTo(kNewWidth(200));
        make.height.mas_equalTo(kNewWidth(100));
    }];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btn1.mas_top);
        make.left.mas_equalTo(self.btn1.mas_right).offset(kNewHeight(30));
        make.width.mas_equalTo(kNewWidth(200));
        make.height.mas_equalTo(kNewWidth(100));
    }];
    
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.btn2.mas_top);
        make.left.mas_equalTo(self.btn2.mas_right).offset(kNewHeight(30));
        make.width.mas_equalTo(kNewWidth(200));
        make.height.mas_equalTo(kNewWidth(100));
    }];
}


@end
