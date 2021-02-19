//
//  WEGBaseView.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGBaseView.h"

@implementation WEGBaseView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
        [self prepareView];
    }
    return self;
}
 
- (void)setupUI {
    
}
- (void)prepareView {
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
}


- (void)setTapNoAction:(BOOL)tapNoAction {
    if (tapNoAction) {
        [self setUserInteractionEnabled:YES];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nothingTodo)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
    }
}

- (void)nothingTodo {
    DLog(@"只是单纯的手势");
}


@end
