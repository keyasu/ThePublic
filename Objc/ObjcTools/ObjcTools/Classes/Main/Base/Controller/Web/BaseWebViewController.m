//
//  BaseWebViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "BaseWebViewController.h"
#import <WebKit/WebKit.h>
#import "BaseWebViewModel.h"


@interface BaseWebViewController ()
<
    WKNavigationDelegate,
    WKUIDelegate,
    WKScriptMessageHandler
>

/// web view
@property (nonatomic, strong) WKWebView *wkWebView ;
@property (nonatomic, strong) UIProgressView *myProgressView ;//9.4 添加

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setNavTitle:self.titleStr];
    self.navigationItem.title = self.titleStr;
    
//    [[ToolsInstance instance] setStatusBarStyleDefault:YES];
    
    if (self.loadType == WebViewLoadTypeUnknown) {
        DLog(@"未知 数据加载类型");
    }else {
        NSDictionary * dic = [[BaseWebViewModel shareModel] getDataWithLoadType:self.loadType];
        NSString * tStr = [dic stringForKey:@"titleStr"];
        NSString * urlStr = [dic stringForKey:@"urlStr"];
        
//        [self setNavTitle:tStr];
        self.url = urlStr;
    }
    
    //初始化界面
    [self initView];
    [self initShareBtn];
}

//创建分享按钮
- (void)initShareBtn {
    ///
}

//#pragma mark - 初始化按钮
- (void)initCustomView {
    ///
}
- (void)intiCustomAction {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payResult:) name:@"weixinSuccess" object:nil];

}
- (void)payResult:(NSNotification *)noti {
    // 可以先调用一次goback 解决weixin:pay出现的白屏问题
    // [self backClick];
    
    //https://www.baidu.com
    //http://192.168.1.14:9871/default/index
    NSURL *newUrl = [NSURL URLWithString:self.url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:newUrl];
    [request setValue:@"doulanlive.doulan.com://" forHTTPHeaderField:@"Referer"];
    [self.wkWebView loadRequest:request];
    
}
#pragma mark - 初始化界面
- (void)initView {
    //9.11 修改
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = [WKUserContentController new];
    [configuration.userContentController addScriptMessageHandler:self name:@"jsCallNativeShare"];
    [configuration.userContentController addScriptMessageHandler:self name:@"goDetail"];
    [configuration.userContentController addScriptMessageHandler:self name:@"goLiveRoom"];
    [configuration.userContentController addScriptMessageHandler:self name:@"shareDown"];
        
    self.wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenW, kScreenH - kNavigationBarHeight) configuration:configuration];
    //这行代码可以是侧滑返回webView的上一级，而不是根控制器（*只针对侧滑有效）
    [self.wkWebView setAllowsBackForwardNavigationGestures:YES];
    self.wkWebView.backgroundColor = [UIColor colorWithHex:0xefefef];
    
    if (self.url != nil) {
        //过滤字符串前后的空格
        NSString *urlStr = [self.url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    }
    self.wkWebView.navigationDelegate = self;
    self.wkWebView.UIDelegate = self;
    [self.view addSubview:self.wkWebView];
    if (@available(ios 11.0,*)) {
        //2018.9.6 wkwebview适配iphoneX
        self.wkWebView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    if (_myProgressView == nil) { //9.4
        _myProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 1)];
        _myProgressView.tintColor = UIColor.blueColor;
        _myProgressView.trackTintColor = UIColor.hex_666666;
    }
    [self.view addSubview:self.myProgressView];
    //  20190523 取消 web 进度条
    [self.myProgressView setHidden:YES];
    [self.wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];//获取进度条
    [self.wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];//获取标题
}
#pragma mark - event response
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //加载进度值
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (object == self.wkWebView) {
            [self.myProgressView setAlpha:1.0f];
            [self.myProgressView setProgress:self.wkWebView.estimatedProgress animated:YES];
            if(self.wkWebView.estimatedProgress >= 1.0f) {
                [UIView animateWithDuration:0.5f
                                      delay:0.3f
                                    options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{
                                     [self.myProgressView setAlpha:0.0f];
                                 }
                                 completion:^(BOOL finished) {
                                     [self.myProgressView setProgress:0.0f animated:NO];
                                 }];
            }
        }else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    }else if ([keyPath isEqualToString:@"title"]) {
        //网页title
        if (object == self.wkWebView) {
            if (self.wkWebView.title.length > 0) {
                [self setNavTitle:self.wkWebView.title];
            }
        }else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//此处是js调用oc的方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSLog(@"%@", message.name);
    NSString * msgName = [NSString stringWithFormat:@"%@", message.name];
    
    
    if ([msgName isEqualToString:@"jsCallNativeShare"]) {
        //js 调用本地代码
        //NSString *url = message.body;
        //share_url = url;
        //shareBtn.hidden = NO;
        //
    }else if ([msgName isEqualToString:@"goDetail"]) {
        NSString * msgBody = [NSString stringWithFormat:@"%@", message.body];
        // TODO: 去用户详情页面
    }else if ([msgName isEqualToString:@"goLiveRoom"]) {
        NSDictionary *msgBody = message.body;
        NSString *roomNumber = [msgBody stringForKey:@"roomnumber"];
        NSString *userid = [msgBody stringForKey:@"userid"];
        // TODO: 去 直播间
        
        
    }else if ([msgName isEqualToString:@"shareDown"]) {
        DLog(@"");
        [self showShareView];
    }
    else {}
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    //此处的url是web页中获取到的 需要对它进行判断
    NSString *url = [navigationAction.request.URL.absoluteString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    DLog(@"url===%@",url);

    decisionHandler(WKNavigationActionPolicyAllow);
    
}

//2017.9.7 白屏
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView API_AVAILABLE(macosx(10.11), ios(9.0)); {
    [webView reload];
}

-(void)viewDidDisappear:(BOOL)animated {
    if (self.wkWebView) {
        self.wkWebView.navigationDelegate = nil;
        self.wkWebView.UIDelegate = nil;
    }
    
}
//

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.wkWebView) {
        self.wkWebView.navigationDelegate = self;
        self.wkWebView.UIDelegate = self;
    }
        
    [self statusStatusBarDefault:YES];
    
}
#pragma mark - 准备加载页面
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    //    DLog(@"==========准备加载页面");
}

#pragma mark - 已开始加载页面，可以在这一步向view中添加一个过渡动画
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    //加载圈圈(展示)
//    progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    progress.mode = MBProgressHUDModeIndeterminate;//loading菊花小圆圈
//    /**2.HUD背景框的属性*/
//    progress.color = [UIColor blackColor];//设置背景颜色
//    progress.color=[progress.color colorWithAlphaComponent:0.5];
//    progress.labelText=@"玩命加载中~~~";
    
}
//
#pragma mark - 页面已全部加载，可以在这一步把过渡动画去掉
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //加载圈圈(隐藏)
    //[progress hide:YES afterDelay:1.5f];
    [webView evaluateJavaScript:@"fromAppGetShare()" completionHandler:^(id _Nullable item, NSError * _Nullable error) { //调用js函数
        DLog(@"");
    }];
    [webView evaluateJavaScript:@"document.title" completionHandler:^(id object, NSError * error) {
        if ([object isKindOfClass:[NSString class]]) {
            if (![[NSString stringWithFormat:@"%@", object] isBlankString]) {
                self.navigationItem.title=object;//获取网页标题
                [self setNavTitle:object];
            }
            
        }
    }];
}
//3.15 webview弹js的弹框
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    //DLOG(@"msg = %@ frmae = %@",message,frame);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - 加载页面失败
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
//    progress.mode = MBProgressHUDModeText;
//    progress.labelText=@"加载失败了";
//    [progress hide:YES afterDelay:1.5f];
    
}

- (void)dealloc {
    //移除按钮的唤起事件
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"jsCallNativeShare"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"goDetail"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"goLiveRoom"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"shareDown"];
    
    [self.wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.wkWebView removeObserver:self forKeyPath:@"title"];
    
}

- (void)leftBarItemAction {
    
    if ([self.wkWebView canGoBack]) {
        [self.wkWebView goBack];
    }else {
        [self popViewController];
    }
}

#pragma mark - 显示分享页面的数据
- (void)showShareView {
    if (![WXApi isWXAppInstalled] || ![WXApi isWXAppSupportApi]) {
        DLog(@"请安装微信之后重试");
        [self showMsg:@"请安装微信之后重试"];
        
        return;
    }
    //
    [self shareBtnClick:nil];
}
// 分享按钮点击事件
- (void)shareBtnClick:(UIButton *)sender
{
    // TODO: 去分享的操作
    
}


@end
