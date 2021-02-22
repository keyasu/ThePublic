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
#import "XHDeviceDataLocalInstance.h"

@interface XHDeviceDataViewController ()

///
@property (nonatomic, strong) NSMutableArray *dataCource;
///
@property (nonatomic, strong) NSString *newworkType;

@end

@implementation XHDeviceDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.newworkType = @"";
    @weakify(self);
    [XHDeviceDataNetworkInstance getNetworkTypeByReachability:^(NSString * _Nonnull newwork) {
        @strongify(self);
        self.newworkType = newwork;
        [self setupUI];
    }];
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
        cell.tLabel.text = [NSString stringWithFormat:@"%ld - %@", (long)indexPath.row+1, model.tStr];
        cell.dLabel.text = model.dStr;
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kNewWidth(88);
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString * tStr = section == 0 ? @"网络信息" : (section == 1 ? @"设备信息" : @"APP信息");
    return [@"   " append:tStr];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString * tStr = section == 0 ? @"网络信息" : (section == 1 ? @"设备信息" : @"APP信息");
    UILabel * l = [UILabel labelWithTitle:[@"   " append:tStr] FontSize:28 Color:UIColor.hex_999999 BackgroundColor:UIColor.hex_F2F2F2];
    l.frame = CGRectMake(0, 0, kScreenW, kNewHeight(88));
    
    return l;
}

- (NSMutableArray *)getArrray {
    //MARK: 网络数据
    NSArray * netWorkData = @[
        @{@"tStr": @"当前网络类型", @"dStr": [XHDeviceDataNetworkInstance getNetworkType]},
        @{@"tStr": @"当前网络类型", @"dStr": self.newworkType},
        @{@"tStr": @"Wifi信息", @"dStr": [NSString stringWithFormat:@"%@", [(NSDictionary *)[XHDeviceDataNetworkInstance fetchSSIDInfo] toJSONstring]]},
        @{@"tStr": @"WIFI名字", @"dStr": [XHDeviceDataNetworkInstance getWifiSSID]},
        @{@"tStr": @"WIFi的MAC地址", @"dStr": [XHDeviceDataNetworkInstance getWifiBSSID]},
        @{@"tStr": @"Wifi信号强度", @"dStr": [XHDeviceDataNetworkInstance getWifiSignalStrength]},
        @{@"tStr": @"设备IP地址", @"dStr": [XHDeviceDataNetworkInstance getIPAddress]},
        @{@"tStr": @"运营商类型", @"dStr": [XHDeviceDataNetworkInstance carrierName]},
    ];
    //MARK: 获取设备信息
    NSArray * localData = @[
        @{@"tStr": @"设备所有者的名称", @"dStr": [XHDeviceDataLocalInstance device_name]},
        @{@"tStr": @"设备的类别", @"dStr": [XHDeviceDataLocalInstance device_model]},
        @{@"tStr": @"设备的scale", @"dStr": [XHDeviceDataLocalInstance device_scale]},
        @{@"tStr": @"设备的分辨率", @"dStr": [XHDeviceDataLocalInstance device_screen]},        
        @{@"tStr": @"本地化版本", @"dStr": [XHDeviceDataLocalInstance device_localizedModel]},
        @{@"tStr": @"当前版本", @"dStr": [XHDeviceDataLocalInstance device_systemVersion]},
        @{@"tStr": @"当前系统", @"dStr": [XHDeviceDataLocalInstance device_systemName]},
        @{@"tStr": @"唯一表示符ID", @"dStr": [XHDeviceDataLocalInstance device_UUIDString]},
        @{@"tStr": @"当前语言", @"dStr": [XHDeviceDataLocalInstance device_language]},
        @{@"tStr": @"当前的国别", @"dStr": [XHDeviceDataLocalInstance device_country]},
        @{@"tStr": @"当前电量", @"dStr": [NSString stringWithFormat:@"%.0f", [XHDeviceDataLocalInstance device_batteryLevel]]},
        @{@"tStr": @"电量损耗", @"dStr": @"手机设置-电池-电池健康查看"},
        @{@"tStr": @"内存", @"dStr": [XHDeviceDataLocalInstance device_memory]},
        
    ];
    //MARK: app的信息
    NSArray * appData = @[
        @{@"tStr": @"名称", @"dStr": [XHDeviceDataLocalInstance app_displayName]},
        @{@"tStr": @"版本", @"dStr": [XHDeviceDataLocalInstance app_version]},
        @{@"tStr": @"Build版本", @"dStr": [XHDeviceDataLocalInstance app_Buildversion]},
        @{@"tStr": @"bundleID", @"dStr": [XHDeviceDataLocalInstance app_bundleID]},
    ];
    
    NSArray * netWorkDataModels = [NSArray yy_modelArrayWithClass:[XHDeviceDataModel class] json:netWorkData];
    NSArray * localDataModels = [NSArray yy_modelArrayWithClass:[XHDeviceDataModel class] json:localData];
    NSArray * appDataModels = [NSArray yy_modelArrayWithClass:[XHDeviceDataModel class] json:appData];
    
    NSArray * arr = @[
        netWorkDataModels,
        localDataModels,
        appDataModels
    ];
    ;
    return [NSMutableArray arrayWithArray:arr];
}




@end


