//
//  XHThreadViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHThreadViewController.h"
#import "XHCustomThread.h"


@interface XHThreadViewController ()

@end

@implementation XHThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// NSThread 线程的生命周期 当线程中的任务执行完毕之后 销毁这个线程对象

/// 这里写一些示例代码
- (void)setupUI {
    NSArray * arr = @[@"1", @"2", @"3", @"4"];
    for (int i=0; i<arr.count; i++) {
        NSString * tStr = [NSString stringWithFormat:@"创建线程 - %@", [arr SafeObjectAt:i]];
        //
        UIButton * btn = [[UIButton buttonTitle:tStr TitleColor:UIColor.hex_00184C FontSize:36 CornerRadius:0 BackgroundColor:UIColor.hex_random] touchUpInsideAction:^{
            [self btnActioinWith:i];
        }];
        
        [self.view addSubview:btn];
        
        CGFloat width = kNewWidth(750/2);
        CGFloat height = kNewHeight(100);
        CGFloat btnX = kNewHeight(0);
        CGFloat btnY = kNewHeight(200)*(i+1);
        
        btn.frame = CGRectMake(btnX, btnY, width, height);
                
    }
        
}
- (void)btnActioinWith:(int)i {
    switch (i) {
        case 0:
            [self create_thread_1];
            break;
        case 1:
            [self create_thread_2];
            break;
        case 2:
            [self create_thread_3];
            break;
        case 3:
            [self create_thread_4];
            break;
        
        default:
            break;
    }
}

///示例代码1
- (void)create_thread_1 {
    NSThread *t = [[NSThread alloc] initWithTarget:self selector:@selector(fuck:) object:@"abc"];
    t.name = @"线程名字";
    t.threadPriority = 1; //范围 0 - 1, 默认 0.5
    [t start];
}

///示例代码2
- (void)create_thread_2 {
    // 1
    if (@available(iOS 10.0, *)) {
        [NSThread detachNewThreadWithBlock:^{
            NSLog(@"blcok  %@", [NSThread currentThread]);
        }];
    }
    
    // 2
    [NSThread detachNewThreadSelector:@selector(fuck:) toTarget:self withObject:@"OPQ"];
}

///示例代码3
- (void)create_thread_3 {
    [self performSelectorInBackground:@selector(fuck:) withObject:@"back fuck"];
}


- (void)fuck:(NSString *)para {
    NSLog(@"%@ %@ ", para, [NSThread currentThread]);
    
    [NSThread sleepForTimeInterval:8]; // 线程暂停
    
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]]; //从现在开始睡3秒之后醒过来
    
    [NSThread exit];  //强制退出线程  // 如果在 for 循环里使用 break 退出, 那么表示任务执行完毕退出
}



/// 示例代码4
- (void)create_thread_4 {
    
    // 如果需要直接使用 NSThread alloc init 这样的方式创建任务, 需要自定义子类, 然后重写 main 方法, 就可以执行
    XHCustomThread *c = [[XHCustomThread alloc] init];
    
    [c start];
    
}



@end
