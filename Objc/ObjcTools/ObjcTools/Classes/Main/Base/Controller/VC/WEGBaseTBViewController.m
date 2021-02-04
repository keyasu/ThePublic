//
//  WEGBaseTBViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "WEGBaseTBViewController.h"

@interface WEGBaseTBViewController ()

@end

@implementation WEGBaseTBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self readyTableView];
    
    [self requestList];
}


- (void)readyTableView {
    [self prepareTableView];
    [self optimizeMethod];
}

// MARK: - 初始化 tableView ,基类调用，如果如果子类有需要可以override。
/// 初始化 tableView ,基类调用，如果如果子类有需要可以override。
- (void)prepareTableView {
    
}
// MARK: - 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
/// 初始化完成之后优化方法，比如设置cell class,tableview实际frame 等 需要在初始化 view 之后,如果没有特别的地方这个方法可以不用调用
- (void)optimizeMethod {
    
}

- (void)setTvRect:(CGRect)tvRect {
    _tvRect = tvRect;
    
    self.tablev.frame = tvRect;
}



- (void)setContentInsetTop:(CGFloat)contentInsetTop {
    _contentInsetTop = contentInsetTop;
    
    UIEdgeInsets contentInset = self.tablev.contentInset;
    contentInset.top += contentInsetTop;
    self.tablev.contentInset = contentInset;
}

// MARK: - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

/// MARK: - 提示没有更多数据加载
- (void)fetchDataWithDataCount:(NSInteger)count {
    if (count == 0) {
        if (self.page > 1) {
            self.page -= 1;
        }
        if (self.tablev.mj_footer != nil) {
            [self.tablev.mj_footer endRefreshingWithNoMoreData];
        }
    }
}

- (void)setTvloadType:(TVloadType)tvloadType {
    _tvloadType = tvloadType;
    __weakSelf;
    switch (tvloadType) {
        case TVloadTypeNone:
        {
            //NSLog(@"");
        }
            break;
        case TVloadTypeRefresh:
        {
            MJRefreshGifHeader * gifHeader =
            [MJRefreshGifHeader headerWithRefreshingBlock:^{
                [weakSelf refreshTableView];
            }];
            
            NSArray * headerImages = [UIView getImageFromGifResource:@"live_poll_loading"];
            [gifHeader setImages:@[headerImages[0]] forState:MJRefreshStateIdle];
            [gifHeader setImages:headerImages forState:(MJRefreshStatePulling)];
            [gifHeader setImages:headerImages forState:MJRefreshStateRefreshing];
            [gifHeader setImages:headerImages forState:(MJRefreshStateWillRefresh)];
            
            gifHeader.stateLabel.hidden = YES;
            gifHeader.lastUpdatedTimeLabel.hidden = YES;
            
            self.tablev.mj_header = gifHeader;
            
//            MJRefreshNormalHeader *header =
//            [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//                [weakSelf refreshTableView];
//            }];
//            // 隐藏上次的刷新时间
//            self.tablev.mj_header = header;
            
        }
            break;
        case TVloadTypeMore:
        {
            MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                [weakSelf loadMoreTableView];
            }];
            
            weakSelf.tablev.mj_footer = footer;
            
        }
            break;
        case TVloadTypeAll:
        {
            MJRefreshGifHeader * gifHeader =
            [MJRefreshGifHeader headerWithRefreshingBlock:^{
                [weakSelf refreshTableView];
            }];
            
            NSArray * headerImages = [UIView getImageFromGifResource:@"live_poll_loading"];
            [gifHeader setImages:@[headerImages[0]] forState:MJRefreshStateIdle];
            [gifHeader setImages:headerImages forState:(MJRefreshStatePulling)];
            [gifHeader setImages:headerImages forState:MJRefreshStateRefreshing];
            [gifHeader setImages:headerImages forState:(MJRefreshStateWillRefresh)];
            
            gifHeader.stateLabel.hidden = YES;
            gifHeader.lastUpdatedTimeLabel.hidden = YES;
            
            self.tablev.mj_header = gifHeader;
            
//            MJRefreshNormalHeader *header =
//            [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//                [weakSelf refreshTableView];
//            }];
//            [header.lastUpdatedTimeLabel setHidden:true];
//            self.tablev.mj_header = header;
            
            MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                [weakSelf loadMoreTableView];
            }];
            self.tablev.mj_footer = footer;
            
        }
            break;
            
        default:
        {
            DLog(@"nothing need todo ");
        }
            break;
    }
    
}

- (void)refreshTableView {
    self.page = 1;
    [self requestList];
}


- (void)loadMoreTableView {
    self.page++;
    [self requestList];
}
// MARK: - 请求数据，供具体子类覆盖
/// 请求数据，供具体子类覆盖
- (void)requestList {
    [self stopAnimation];
}


/// MARK: - 刷新tableview
/// 刷新tableview
- (void)reloadTBView {
    [self stopAnimation];
    [self.tablev reloadData];
}
- (void)stopAnimation {
    if (self.tablev.mj_header) {
        [self.tablev.mj_header endRefreshing];
    }
    if (self.tablev.mj_footer) {
        [self.tablev.mj_footer endRefreshing];
    }
}



// MARK: - lazy load
- (UITableView *)tablev {
    if (!_tablev) {
        
        CGRect rect = CGRectMake(0, kNavigationBarHeight, kScreenW, kScreenH - kNavigationBarHeight);
        
        UITableView *tv = [[UITableView alloc] initWithFrame:(rect) style:(UITableViewStylePlain)];
        tv.delegate = self;
        tv.dataSource = self;
        tv.separatorStyle = UITableViewCellSeparatorStyleNone;
        tv.tableFooterView = [[UIView alloc] init];
        tv.estimatedRowHeight = 0.f;
        tv.estimatedSectionHeaderHeight = 0.f;
        tv.estimatedSectionFooterHeight = 0.f;
        
        tv.backgroundColor = [UIColor whiteColor];
        //预算高度
        tv.estimatedRowHeight = 44;
        tv.rowHeight = UITableViewAutomaticDimension;
        
        
        if (@available (iOS 11.0, *)) {
            tv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [self.view addSubview:tv];
        
        _tablev = tv;
    }
    return _tablev;
}


@end
