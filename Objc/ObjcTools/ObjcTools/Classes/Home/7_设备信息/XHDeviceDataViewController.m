//
//  XHDeviceDataViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHDeviceDataViewController.h"
#import "XHDeviceDataViewCell.h"
#import "XHDeviceDataModel.h"
#import "XHDeviceDataNetworkInstance.h"

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
    
    self.dataCource = [self getArrray];
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
        XHDeviceDataModel * model = [sectionData SafeObjectAt:indexPath.row];
        cell.tLabel.text = [NSString stringWithFormat:@"%ld - %@", (long)indexPath.row+1, model.dStr];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray * sectionData = [self.dataCource SafeObjectAt:indexPath.section];
    XHDeviceDataModel * model = [sectionData SafeObjectAt:indexPath.row];
    
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

- (NSMutableArray *)getArrray {
    NSArray * netWorkData = @[
        @{@"tStr": @"当前网络类型", @"dStr": [XHDeviceDataNetworkInstance getNetworkType]},
        @{@"tStr": @"当前网络类型", @"dStr": [XHDeviceDataNetworkInstance getNetworkTypeByReachability]},
        @{@"tStr": @"Wifi信息", @"dStr": [NSString stringWithFormat:@"%@", [XHDeviceDataNetworkInstance fetchSSIDInfo]]},
        @{@"tStr": @"WIFI名字", @"dStr": [XHDeviceDataNetworkInstance getWifiSSID]},
        @{@"tStr": @"WIFi的MAC地址", @"dStr": [XHDeviceDataNetworkInstance getWifiBSSID]},
        @{@"tStr": @"Wifi信号强度", @"dStr": [XHDeviceDataNetworkInstance getWifiSignalStrength]},
        @{@"tStr": @"设备IP地址", @"dStr": [XHDeviceDataNetworkInstance getIPAddress]},
        @{@"tStr": @"运营商类型", @"dStr": [XHDeviceDataNetworkInstance carrierName]},
    ];
    
    NSArray * localData = @[
        @{@"tStr": @"XHLock9PointViewController", @"dStr": @"9宫格解锁"},
        @{@"tStr": @"XHLock9PointViewController", @"dStr": @"9宫格解锁"},
    ];
    NSArray * netWorkDataModels = [NSArray yy_modelArrayWithClass:[XHDeviceDataModel class] json:netWorkData];
    NSArray * localDataModels = [NSArray yy_modelArrayWithClass:[XHDeviceDataModel class] json:localData];
    
    NSArray * arr = @[
        netWorkDataModels,
        localDataModels
    ];
    ;
    return [NSMutableArray arrayWithArray:arr];
}


@end


