//
//  XHRACTimerViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/23.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACTimerViewController.h"

@interface XHRACTimerViewController ()

@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, strong) UIButton *btn4;

@property (nonatomic, assign) NSInteger time;
@property (nonatomic, strong) RACDisposable *disposble;


@end

@implementation XHRACTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    UIButton * btn1 = [[UIButton buttonWithTitle:@"NSTimer" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self demo1];
    }];
    UIButton * btn2 = [[UIButton buttonWithTitle:@"GCCD" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self demo2];
    }];
    
    UIButton * btn3 = [[UIButton buttonWithTitle:@"RACSignal" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self demo3];
    }];
    self.btn4 = [[UIButton buttonWithTitle:@"数据转模型" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self demo4];
    }];
    
    [self.view weg_addSubviews:
     btn1,
     btn2,
     btn3,
     self.btn4
     , nil];
    
    btn1.frame = CGRectMake(20, kNavigationBarHeight+20, kNewWidth(150), kNewHeight(100));
    btn2.frame = CGRectMake(20, btn1.bottom+20, kNewWidth(150), kNewHeight(100));
    btn3.frame = CGRectMake(20, btn2.bottom+20, kNewWidth(150), kNewHeight(100));
    self.btn4.frame = CGRectMake(20, btn3.bottom+20, kNewWidth(150), kNewHeight(100));
    
    
}
- (void)demo4 {
    
    //改变按钮装态
    self.btn4.enabled = NO;
    
    //倒计时时间
    self.time = 10;
    @weakify(self);
   self.disposble =  [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]]subscribeNext:^(NSDate * _Nullable x) {
       @strongify(self);
       //让时间减去
       self.time--;
        //设置文字
        NSString *btnText = self.time > 0 ? [NSString stringWithFormat:@"请等待%ld秒", self.time]: @"重新发送";
        
        
        [self.btn4 setTitle:btnText forState:self.time >0 ? (UIControlStateDisabled):(UIControlStateNormal)];
        
        if (self.time > 0) {
            self.btn4.enabled = NO;
        }else
        {
            self.btn4.enabled = YES;
           //取消订阅
            [self.disposble dispose];
            
        }
        
   }];
    
    
    
}

- (void)demo3
{
    [[RACSignal interval:1.0 onScheduler:[RACScheduler scheduler]]subscribeNext:^(NSDate * _Nullable x) {
        NSLog(@"%@",[NSThread currentThread]);
    }];
}

- (void)demo2
{
    //GCD 设置timer
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    //GCD时间事件 1000000000
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"---%@", [NSThread currentThread]);
    });
    
    //启动
    dispatch_resume(timer);
    _timer = timer;
    
}

-(void)demo1
{

    //NSDefaultRunLoopMode 默认模式
    //UITrackingRunLoopMode UI模式
    //NSRunLoopCommonModes 占位模式
    //事件 交给谁处理？Runloop
    
    NSTimer *timer =  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    /*
     //可以这么的封装起来使用
    [NSTimer dl_scheduledTimerWithTimeInterval:1 block:^{
        
    } repeats:YES];
    */
    
}

-(void)timeMethod
{
    NSLog(@"指定定时器了");
}


@end
