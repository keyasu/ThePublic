//
//  XHDeviceDataViewCell.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHDeviceDataViewCell.h"

@interface XHDeviceDataViewCell ()

@end

@implementation XHDeviceDataViewCell

- (void)setupUI {
    /// <#desc#>
    self.tLabel = [UILabel labelWithTitle:@"标题" FontSize:32 Color:UIColor.hex_00184C];
    /// <#desc#>
    self.dLabel = [UILabel labelWithTitle:@"标题" FontSize:28 Color:UIColor.hex_999999];
    
    [self.contentView weg_addSubviews:
     self.tLabel,
     self.dLabel
     , nil];
}
- (void)prepareView {
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(kNewWidth(16));
    }];
    [self.dLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(self.contentView.mas_right).mas_offset(-kNewWidth(16+10));
    }];
    
}


@end
