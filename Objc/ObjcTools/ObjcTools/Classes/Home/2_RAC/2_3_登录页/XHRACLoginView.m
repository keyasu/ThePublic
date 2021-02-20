//
//  XHRACLoginView.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACLoginView.h"

@interface XHRACLoginView ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIButton *lwbtn;

@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UITextField *pwTF;
@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) RACCommand * loginCommand;

@end

@implementation XHRACLoginView

- (void)setupUI {
    self.phoneTF = [UITextField];
    self.pwTF;
    self.loginBtn;
    
    [self weg_addSubviews:
     self.phoneTF,
     self.pwTF,
     self.loginBtn
     , nil];
}
- (void)prepareView {
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
}


@end
