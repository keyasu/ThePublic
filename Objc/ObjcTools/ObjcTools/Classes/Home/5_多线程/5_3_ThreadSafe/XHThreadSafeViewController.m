//
//  XHThreadSafeViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHThreadSafeViewController.h"

@interface XHThreadSafeViewController ()
/// 第1个售票员
@property (nonatomic, strong) NSThread *conductor1;
/// 第2个售票员
@property (nonatomic, strong) NSThread *conductor2;
/// 第1个售票员
@property (nonatomic, strong) NSThread *conductor3;

/// 第1个售票员
@property (nonatomic, assign) NSInteger count;

@end
/**
 *  线程安全 添加互斥锁
 */
@implementation XHThreadSafeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.count = 100;
    
    self.conductor1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.conductor2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.conductor3 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    
    self.conductor1.name = @"conductor1";
    self.conductor2.name = @"conductor2";
    self.conductor3.name = @"conductor3";
    
    [self.conductor1 start];
    [self.conductor2 start];
    [self.conductor3 start];
    
}

- (void)saleTicket {
    
    while (YES) {
        // 这个锁必须是全局唯一的
        // 注意加锁的位置
        // 注意加锁的前提条件 多线程访问同一块资源
        // 注意加锁是需要代价的 需要耗费性能
        //
        @synchronized (self) {  //线程安全 价格互斥锁就...            
            if (self.count > 0) {
                for (NSInteger i = 0; i < 100000; i ++) {}
                self.count -= 1;
                NSLog(@"票数 %ld 售票员 %@", self.count, [NSThread currentThread].name);
            } else {
                NSLog(@"买完了");
                break;
            }
        }
    }
}



- (void)text {
    
    // 回到主线程
    // 参数1: 要执行的方法
    // 参数2: 传递的参数
    // 参数3: 如果这个 performSelectorOnMainThread 下发还有其他的代码, YES 表示等待 selector 里面的方法执行完毕再往下执行, NO 表示不等待就直接继续执行
    //self performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>

    
    // 去往后台线程执行
    //self performSelectorInBackground:<#(nonnull SEL)#> withObject:<#(nullable id)#>
    
    
    
    //
    //self performSelector:<#(nonnull SEL)#> onThread:<#(nonnull NSThread *)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>
    
    
    
    //骚操作 performSelectorOnMainThread 是 NSObject 的分类方法,  setImage 是 UIImageView 的 setter 方法, 这样就直接在主线程更新 UI, 少写一步
    UIImageView *v;
    [v performSelectorOnMainThread:@selector(setImage:) withObject:[UIImage new] waitUntilDone:YES];
    
    
}

@end
