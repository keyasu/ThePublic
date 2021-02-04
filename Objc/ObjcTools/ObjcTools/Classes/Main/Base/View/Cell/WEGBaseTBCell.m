//
//  WEGBaseTBCell.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGBaseTBCell.h"

@interface WEGBaseTBCell ()

@end

@implementation WEGBaseTBCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 设置 cell 的点击效果为 无  目前所有的点击效果都是 点击一下变灰一下
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView setClipsToBounds:YES];
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

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
