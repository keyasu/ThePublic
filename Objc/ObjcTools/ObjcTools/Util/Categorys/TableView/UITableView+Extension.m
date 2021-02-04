//
//  UITableView+Extension.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

- (void)registerFromClass:(nullable Class)cellClass {
    [self registerClass:[cellClass self] forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerHeaderFooterViewFromClass:(nullable Class)cellClass {
    [self registerClass:[cellClass self] forHeaderFooterViewReuseIdentifier:NSStringFromClass(cellClass)];
}


@end
