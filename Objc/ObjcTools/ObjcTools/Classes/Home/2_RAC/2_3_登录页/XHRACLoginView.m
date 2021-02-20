//
//  XHRACLoginView.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

typedef void(^CallBlock)(BOOL callBlock);

#import "XHRACLoginView.h"

@interface XHRACLoginView ()

@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UITextField *pwTF;
@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) RACCommand * loginCommand;


@end

@implementation XHRACLoginView

- (void)setupUI {
    self.phoneTF = [UITextField textFieldWithPlaceholder:@"输入账户" LeftMargin:kNewWidth(16) BgColor:UIColor.hex_00184C_20 CornerRadius:10];
    self.pwTF = [UITextField textFieldWithPlaceholder:@"输入密码" LeftMargin:kNewWidth(16) BgColor:UIColor.hex_00184C_20 CornerRadius:10];
    self.loginBtn = [UIButton buttonTitle:@"登陆" TitleColor:UIColor.hex_00184C FontSize:36 CornerRadius:16 BackgroundColor:UIColor.hex_00184C_20];
    
    [self weg_addSubviews:
     self.phoneTF,
     self.pwTF,
     self.loginBtn
     , nil];
}
- (void)prepareView {
    [self useRACMethod];
}
- (void)useRACMethod
{
    // map 可以转换 信号 （文本输入的字符串 转化为 是否长度为3的bool值）
    // 验证输入框的合法性
    RACSignal *phoneValidSignal = [self.phoneTF.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        return @((value.length == 3));
    }];
    RACSignal *pwValidSignal = [self.pwTF.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        return @(value.length > 1 && value.length <= 6);
    }];
    
    // 根据监听输入框的内容，是否合法，来改变输入框的背景色
    [[phoneValidSignal map:^id _Nullable(id  _Nullable value) {
        return [value boolValue] ? UIColor.orangeColor : UIColor.yellowColor;
    }] subscribeNext:^(id  _Nullable x) {
        self.phoneTF.backgroundColor = x;
    }];
    
    RAC(self.pwTF, backgroundColor) = [pwValidSignal map:^id _Nullable(id  _Nullable value) {
        return [value boolValue] ? UIColor.orangeColor : UIColor.yellowColor;
    }];
    
    {
        // 合并信号（手机号，密码输入框），创建一个新的关于按钮状态的信号，改变按钮的状态
        RACSignal *activeBtnSignal = [RACSignal combineLatest:@[phoneValidSignal, pwValidSignal] reduce:^id _Nullable(NSNumber *ph,NSNumber *pw){
            return @([ph boolValue] && [pw boolValue]);
        }];
        // 把按钮 和信号绑定
        [activeBtnSignal subscribeNext:^(id  _Nullable x) {
            self.loginBtn.backgroundColor = [x boolValue] ? UIColor.redColor : UIColor.grayColor;
        }];
        /*
        // 看着是不是上面的方法比较啰嗦, 我也这么任务的,
        // 可以提前设置好登录按钮的属性, 在这里可以对按钮就行对应的操作,
        // 然而, 就我个人而言还是使用下面的这个方法比较方便一点
        RAC(self.loginBtn, enabled) = [RACSignal combineLatest:@[self.phoneTF.rac_textSignal, self.pwTF.rac_textSignal] reduce:^id _Nonnull(NSString * nameStr, NSString * pwdStr){
            if (nameStr.length > 3 && pwdStr.length > 3) {
                return @(YES);
            }
            return @(NO);
        }];
        */
    }
    
    /// 创建一个登陆请求的信号
    RACSignal *loginSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [self loginRequestWithPhone:self.phoneTF.text pwd:self.pwTF.text callBlock:^(BOOL res) {
            [subscriber sendNext:@(res)];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
    
    [[[[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
      doNext:^(id  _Nullable x) {
          // 边际效应 不改变信号本身
          self.loginBtn.enabled = NO;
      }]
      // flattenMap 返回信号内容
      flattenMap:^__kindof RACSignal * _Nullable(__kindof UIControl * _Nullable value) {
          return loginSignal;
      }]
     subscribeNext:^(id  _Nullable x) {
         NSLog(@"----------%@",x);
         self.loginBtn.enabled = YES;
     }];
    
    
    [self.loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"--------logincommand:%@",x);
    }];
    
    [[self.loginCommand executionSignals] subscribeNext:^(id  _Nullable x) {
        NSLog(@"--------1:%@",x);
        // 开始网络请求的信号
        self.backgroundColor = [UIColor redColor];
        [x subscribeNext:^(id  _Nullable x) {
            // 网络请求的回调信号
            NSLog(@"--------2:%@",x);
            self.backgroundColor = [UIColor whiteColor];
        }];
    }];
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(__kindof UIControl * _Nullable x) {
         // 开始执行command
         [self.loginCommand execute:nil];
     }];
}

// 模拟网络请求
- (void)loginRequestWithPhone:(NSString *)phone pwd:(NSString *)pwd callBlock:(CallBlock)callBlock
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([phone isEqualToString:@"222"] && [pwd isEqualToString:@"333"]) {
            if(callBlock) callBlock(YES);
        }else{
            if(callBlock) callBlock(NO);
        }
    });
}
- (RACCommand *)loginCommand
{
    if (!_loginCommand) {
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                NSString *phone = @"222";
                NSString *pwd = @"333";
                /// 网络请求
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if ([phone isEqualToString:@"222"] && [pwd isEqualToString:@"333"]) {
                        [subscriber sendNext:@(1)];
                    }else{
                        [subscriber sendNext:@(0)];
                    }
                    [subscriber sendCompleted];
                });
                return nil;
            }];
        }];
    }
    return _loginCommand;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.mas_top).mas_offset(kNewHeight(60));
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(88));
    }];
    [self.pwTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.phoneTF.mas_bottom).mas_offset(kNewHeight(30));
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(88));
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.pwTF.mas_bottom).mas_offset(kNewHeight(130));
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(88));
    }];
}


@end
