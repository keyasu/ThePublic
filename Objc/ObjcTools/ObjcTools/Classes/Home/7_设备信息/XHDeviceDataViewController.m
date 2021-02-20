//
//  XHDeviceDataViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHDeviceDataViewController.h"
#import "XHDeviceDataViewCell.h"
#import "XHHomeViewModel.h"


@interface XHDeviceDataViewController ()

///
@property (nonatomic, strong) NSMutableArray *dataCource;


@end

@implementation XHDeviceDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)setupUI
{
    NSArray * jsonList = [self getArrray];
    NSArray * models = [NSArray yy_modelArrayWithClass:[XHHomeViewModel class] json:jsonList];
    self.dataCource = [NSMutableArray arrayWithArray:models];
    [self reloadTBView];
}


// MARK: - 这个方法给子类设置 tableView 的 样式 ，frame pageSize 等
/// 这个方法给子类设置 tableView 的 样式 ，frame pageSize 等
- (void)prepareTableView {
    [self setTvloadType:TVloadTypeAll];
    [self.tablev registerFromClass:[XHDeviceDataViewCell class]];
}

// MARK: - 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
/// 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
- (void)optimizeMethod
{
    UIView *footer = [UIView viewBgColor:UIColor.hex_FFFFFF];
    footer.frame = CGRectMake(0, 0, kScreenW, kNewHeight(100+50));
    self.tablev.tableFooterView = footer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataCource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section >= self.dataCource.count) {
        return 0;
    }
    NSArray * sectionData = [self.dataCource SafeObjectAt:section];
    if ([sectionData isKindOfClass:[NSArray class]]) {
        return sectionData.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHDeviceDataViewCell * cell = [[XHDeviceDataViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:[XHDeviceDataViewCell cellReuseIdentifier]];
    NSArray * sectionData = [self.dataCource SafeObjectAt:indexPath.section];
    if (indexPath.row < sectionData.count) {
        XHHomeViewModel * model = [sectionData SafeObjectAt:indexPath.row];
        cell.tLabel.text = [NSString stringWithFormat:@"%ld - %@", (long)indexPath.row+1, model.dStr];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XHHomeViewModel * model = [self.dataCource SafeObjectAt:indexPath.row];
    NSString *tStr = model.tStr;
    NSString *dStr = model.dStr;
    if ([tStr isBlankString]) {
        return;
    }
    UIViewController * vc = [[NSClassFromString(tStr) alloc] init];
    vc.gk_navTitle = dStr;
    
    [self pushToController:vc];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kNewHeight(100);
}

- (NSArray *)getArrray {
    NSArray * netWorkData = @[
        @"",
        @"",
    ];
    NSArray * localData = @[
        @"",
        @"",
    ];
    NSArray * arr = @[
        netWorkData,
        localData
    ];
    
    return arr;
}


@end

