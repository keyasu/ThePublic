//
//  XHRACTFLengthViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACTFLengthViewController.h"

@interface XHRACTFLengthViewController ()

/// 输入需要限制字符长度
@property (nonatomic, strong) UITextField *tf1;
@property (nonatomic, strong) UILabel *label1;
/// <#desc#>
@property (nonatomic, strong) UITextField *tf2;
@property (nonatomic, strong) UILabel *label2;

@property (nonatomic, strong) UITextField *tf3;
@property (nonatomic, strong) UILabel *label3;

@end

@implementation XHRACTFLengthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    self.tf1 = [UITextField textFieldWithPlaceholder:@"1. 限制8个字符长度" LeftMargin:8 BgColor:UIColor.hex_00184C_20 CornerRadius:16];
    self.label1 = [UILabel labelWithTitle:@"输入字符长度为: 0" FontSize:24 Color:UIColor.hex_00184C];
    
    self.tf2 = [UITextField textFieldWithPlaceholder:@"2. 限制8个字符长度" LeftMargin:8 BgColor:UIColor.hex_00184C_20 CornerRadius:16];
    self.label2 = [UILabel labelWithTitle:@"输入字符长度为: 0" FontSize:24 Color:UIColor.hex_00184C];
    
    self.tf3 = [UITextField textFieldWithPlaceholder:@"3. 限制5个汉字或者10个字符  1个汉字=两个字符" LeftMargin:8 BgColor:UIColor.hex_00184C_20 CornerRadius:16];
    self.label3 = [UILabel labelWithTitle:@"输入字符长度为: 0" FontSize:24 Color:UIColor.hex_00184C];
    
    [self.view weg_addSubviews:
     self.tf1,
     self.label1,
     
     self.tf2,
     self.label2,
     
     self.tf3,
     self.label3
     
     , nil];
    
    [self tf1ShwoTime];
    [self tf2ShwoTime];
    [self tf3ShwoTime];
    
}

/**
 * 只是限制了输入字符的长度,
 * 使用苹果系统的输入法, 你会发现, 最后一位想输入汉字的话, 拼写不完全,
 * 还需要重新搞搞
 */
- (void)tf1ShwoTime {
    [self.tf1.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        if (x.length > 8) {
            self.tf1.text = [x substringToIndex:8];
        }
        self.label1.text = [NSString stringWithFormat:@"输入字符长度为: %lu", (unsigned long)self.tf1.text.length];
    }];
}

- (void)tf2ShwoTime {
    // 具体看下面的
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledDidChangeAction) name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)tf3ShwoTime {
    // 具体看下面的
}

- (void)textFiledDidChangeAction
{
    if (self.tf2.isFirstResponder) {
        if (self.tf2.text.length > 8 && self.tf2.markedTextRange == nil) {
            NSString * str = [NSString stringWithFormat:@"%@",[self.tf2.text substringToIndex:8]];
            [self.tf2 setText:str];
            self.label2.text = @"输入字符长度为: 8";
        }else {
            if (self.tf2.markedTextRange == nil) {
                self.label2.text = [NSString stringWithFormat:@"输入字符长度为: %lu", (unsigned long)self.tf2.text.length];
            }
        }
    }
    
    if ([self.tf3 isFirstResponder]) {
        [self tf3Action:self.tf3];
    }
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}


- (void)tf3Action:(UITextField *)textField
{
    NSInteger maxLength = 5;
    
    if (textField.markedTextRange == nil) {
        NSUInteger asciiLength = 0;
        for (NSUInteger i = 0; i < textField.text.length; i++) {
            unichar uc = [textField.text characterAtIndex: i];
            //设置汉字和字母的比例  如何限制4个字符或12个字母 就是1:3  如果限制是6个汉字或12个字符 就是 1:2  一次类推
            asciiLength += isascii(uc) ? 1 : 2;
            
            if (asciiLength > maxLength * 2) {
                asciiLength -= isascii(uc) ? 1 : 2;
                NSString * str = [NSString stringWithFormat:@"%@",[textField.text substringToIndex:i]];
                [textField setText:str];
                
                break;
            }
            
            
        }
        NSUInteger getTFLength = asciiLength / 2;
        self.label3.text = [NSString stringWithFormat:@"输入字符长度为: %lu", getTFLength] ;
        
        DLog(@"字符长度为 : %lu", (unsigned long)[self tf3Length]);
        DLog(@"长度为 : %lu", (unsigned long)[self tf3Length]/2);
    }
    
    
}

- (NSUInteger)tf3Length {
    NSString * text = self.tf3.text;
    
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < text.length; i++) {
        unichar uc = [text characterAtIndex: i];
        //设置汉字和字母的比例  如何限制4个字符或12个字母 就是1:3  如果限制是6个汉字或12个字符 就是 1:2  一次类推
        asciiLength += isascii(uc) ? 1 : 2;
    }

  NSUInteger unicodeLength = asciiLength;

  return unicodeLength;

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).mas_offset(kNavigationBarHeight + kNewHeight(60));
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(88));
    }];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.tf1.mas_bottom);
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(50));
    }];
    
    [self.tf2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.label1.mas_bottom);
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(88));
    }];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.tf2.mas_bottom).mas_offset(kNewHeight(30));
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(30));
    }];
    
    [self.tf3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.label2.mas_bottom);
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(88));
    }];
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.tf3.mas_bottom).mas_offset(kNewHeight(30));
        make.width.mas_equalTo(kNewWidth(690));
        make.height.mas_equalTo(kNewHeight(30));
    }];
}

@end
