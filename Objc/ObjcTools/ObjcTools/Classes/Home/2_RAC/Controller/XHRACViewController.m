//
//  XHRACViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACViewController.h"
#import "XHHomeViewCell.h"
#import "XHHomeViewModel.h"


@interface XHRACViewController ()

///
@property (nonatomic, strong) NSMutableArray *dataCource;

@end

@implementation XHRACViewController

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
    [self.tablev registerFromClass:[XHHomeViewCell class]];
}

// MARK: - 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
/// 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
- (void)optimizeMethod
{
    UIView *footer = [UIView viewBgColor:UIColor.hex_FFFFFF];
    footer.frame = CGRectMake(0, 0, kScreenW, kNewHeight(100+50));
    self.tablev.tableFooterView = footer;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataCource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHHomeViewCell * cell = [[XHHomeViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:[XHHomeViewCell cellReuseIdentifier]];
    if (indexPath.row < self.dataCource.count) {
        XHHomeViewModel * model = [self.dataCource SafeObjectAt:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld - %@", (long)indexPath.row+1, model.dStr];
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
    NSArray * arr = @[
        @{@"tStr": @"XHRACTupleViewController", @"dStr": @"元组"},
        @{@"tStr": @"XHRACExampleViewController", @"dStr": @"基本用法"},
        @{@"tStr": @"XHRACLoginViewController", @"dStr": @"登录页"},
        @{@"tStr": @"XHRACTFLengthViewController", @"dStr": @"输入框字符长度"},

    ];
    
    return arr;
}



@end
