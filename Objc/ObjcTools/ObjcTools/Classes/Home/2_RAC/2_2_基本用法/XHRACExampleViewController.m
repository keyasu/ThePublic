//
//  XHRACExampleViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACExampleViewController.h"
#import "XHRACExampleView.h"
#import "NSObject+RACKVOWrapper.h"

@interface XHRACExampleViewController ()

/// <#desc#>
@property (nonatomic, strong) XHRACExampleView *baseView;
@end

@implementation XHRACExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    /**
     * 1. 代替代理：rac_signalForSelector:
     * 2. 代替KVO：rac_valuesAndChangesForKeyPath:
     * 3. 监听事件：rac_signalForControlEvents:
     * 4. 代替通知：rac_addObserverForName:
     * 5. 监听文本框文字改变：rac_textSignal:
     * 6. 多个请求结束后，才能刷新界面：rac_liftSelector:withSignalsFromArray:Signals:
     *
     */
    
    //代理
    [self.view addSubview:self.baseView];
    //KVO
    [[self.baseView rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id  _Nullable x) {
        NSLog(@"新的frame");
    }];
    ///监听事件
    UIButton * btn = [[UIButton buttonTitle:@"改变frame" TitleColor:UIColor.hex_FFFFFF FontSize:36 CornerRadius:0 BackgroundColor:UIColor.blueColor] touchUpInsideAction:^{
        [self demo_kvo];
    }];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(10, 100, kNewWidth(200), kNewWidth(100));
    
    /**
     * 注意：使用以下方法也可打到同样效果
     * 该方法需要额外加入一个头文件#import “NSObject+RACKVOWrapper.h”
     */
//    [self.baseView rac_observeKeyPath:@"frame" options:(NSKeyValueObservingOptionNew) observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
//        NSLog(@"");
//    }];
    
    //通知：rac_addObserverForName:
    [self demo_notification];
    
    //文本框文字改变：rac_textSignal:
    [self demo_textSingal];
    
    //多个请求结束后，才能刷新界面：rac_liftSelector:withSignalsFromArray:Signals:
    [self demo_requests];
    //多个信号合成一个或者
    [self demo_merge_ziaWith];
}


- (void)demo_merge_ziaWith {
    /*
     同时监控多个代理事件，请求事件或信号
     merge:多个信号合并成一个信号，任何一个信号有新值就会调用
     zipWith:把两个信号压缩成一个信号，只有当两个信号同时发出信号内容时，并且把两个信号的内容合并成一个元祖，才会触发压缩流的next事件。 压缩成一个信号。zipWith当一个界面多个请求的时候，要等所有请求完成才更新UI, 等所有信号都发送内容的时候才会调用发送信号 交互顺序，元组内元素的顺序不会变，跟发送的顺序无关，而是跟压缩的顺序有关[signalA zipWith:signalB]—先是A后是B。
     zipWith的功能本来就该服务器来合并多个请求，但是基本上服务器开发人员都反对把多个业务无关的请求合并为一个请求（一般需要查不同的数据库表，甚至访问不同服务化的服务器）。我们做app的没有人和咱们合作，只能自己合并请求处理了。
    */
    
    
}


- (void)demo_requests {
    RACSignal * oneSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"请求数据1");
        [subscriber sendNext:@"数据1"];
        return nil;
    }];
    RACSignal * twoSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"请求数据2");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"数据2"];
        });
        
        return nil;
    }];
    /**
     * 监听两个模块的执行完成
     * 方法的参数必须与坚挺的信号一一对应
     * 方法的参数就是发送的数据
     */
    [self rac_liftSelector:@selector(updateUI:With:) withSignalsFromArray:@[oneSignal, twoSignal]];
    
}

- (void)updateUI:(NSString *)value1 With:(NSString *)value2 {
    NSLog(@"%@ - %@", value1, value2);
    NSLog(@"刷新数据");
}



- (void)demo_textSingal {
    
    CGRect tfRect = CGRectMake(10+100+100, 100, kNewWidth(200), kNewWidth(100));
    UITextField * tf = [[UITextField alloc] initWithFrame:tfRect];
    tf.placeholder = @"输入内容";
    tf.backgroundColor = UIColor.hex_random;
    [self.view addSubview:tf];
    [tf.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        NSLog(@"%@", x);
    }];
}

- (void)demo_notification {
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardDidShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"UIKeyboardDidShowNotification");
    }];
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillHideNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"UIKeyboardWillHideNotification");
    }];
}

- (void)demo_kvo {
    self.baseView.frame = (CGRectMake(10, 150, kNewWidth(700), kNewHeight(300)));
    @weakify(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self);
        self.baseView.frame = (CGRectMake(10, 200, kNewWidth(700), kNewHeight(300)));
    });
}

//MARK: 作为代理使用
- (XHRACExampleView *)baseView {
    if (!_baseView) {
        XHRACExampleView * v = [[XHRACExampleView alloc] initWithFrame:(CGRectMake(10, 200, kNewWidth(700), kNewHeight(300)))];
        [[v rac_signalForSelector:@selector(btn1Action:)] subscribeNext:^(RACTuple * _Nullable x) {
            NSString * str = [NSString stringWithFormat:@"%@", x.first];
            NSLog(@"%@", str);
            [self showMsg:@"btn1 Click"];
        }];
        [[v rac_signalForSelector:@selector(btn2Action:)] subscribeNext:^(RACTuple * _Nullable x) {
            RACTupleUnpack(UIButton * btn) = x;
            [self showMsg:@"btn2 Click"];
            NSLog(@"%@", btn);
        }];
        [v.btn3 touchUpInside:^{
            [self showMsg:@"btn3 Click"];
        }];
        
        _baseView = v;
    }
    return _baseView;
}

@end
