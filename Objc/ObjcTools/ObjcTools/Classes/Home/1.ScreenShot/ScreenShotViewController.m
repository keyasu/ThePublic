//
//  ScreenShotViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "ScreenShotViewController.h"

@interface ScreenShotViewController ()

/// <#desc#>
@property (nonatomic, strong) UIImageView *bgImgView;
/// <#desc#>
@property (nonatomic, strong) UIButton * btn1;
@property (nonatomic, strong) UIButton * btn2;
@property (nonatomic, strong) UIButton * btn3;

/// <#desc#>
@property (nonatomic, strong) UIScrollView *scrollView;
/// <#desc#>
@property (nonatomic, strong) UILabel *dLabel;

@end

@implementation ScreenShotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)setupUI {
    self.bgImgView = [UIImageView viewWithImageName:@""];
    UIButton * btn = [UIButton buttonWithTitle:@"清理" FontSize:36 TitleColor:UIColor.hex_00184C];
    [btn touchUpInside:^{
        self.bgImgView.image = [[UIImage alloc] init];
    }];
    self.btn1 =
    [[UIButton buttonWithTitle:@"1. 一句代码截图"
                      FontSize:36
                    TitleColor:UIColor.hex_00184C] touchUpInsideAction:^{
        [self getImg1];
    }] ;
    
    self.btn2 = [[UIButton buttonWithTitle:@"2. 截图"
                                  FontSize:36
                                TitleColor:UIColor.hex_00184C] touchUpInsideAction:^{
        [self getImg2];
    }];
    
    self.btn3 = [[UIButton buttonWithTitle:@"3. scrollView的内容"
                                  FontSize:36 TitleColor:UIColor.hex_00184C] touchUpInsideAction:^{
        [self getImg3];
    }] ;
    
    
}
- (void)setupNavigationUI {}
//MARK: 一句代码截图
- (void)getImg1 {
    //截屏
    UIView *view = [[UIApplication sharedApplication].keyWindow snapshotViewAfterScreenUpdates:YES];
    
    NSLog(@"%@", view);
}
//MARK: 截屏
- (void)getImg2 {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height), NO, 0.0);
    
    /// 如果是指定view 替换 [UIApplication sharedApplication].keyWindow 就可以
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
   
    UIGraphicsEndImageContext();
    
    //保存
    UIImageWriteToSavedPhotosAlbum(screenShotImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

//MARK: 第三种
- (void)getImg3 {
    
    CGPoint savedContentOffset = self.scrollView.contentOffset;
    CGRect savedFrame = self.scrollView.frame;
    
    self.scrollView.contentOffset = CGPointMake(0.001, 0.001);  ///加了点偏移,为了防止滚动视图底部没有被截取

    self.scrollView.frame = CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.contentSize.width, self.scrollView.contentSize.height);
  
    [self.scrollView setNeedsDisplay];
    
    UIGraphicsBeginImageContextWithOptions(self.scrollView.contentSize, YES, 0.0); //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    [self.scrollView.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    
    self.scrollView.contentOffset = savedContentOffset;
    self.scrollView.frame = savedFrame;
    
    UIGraphicsEndImageContext();
   
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error == nil) {
        NSLog(@"保存成功");
    }
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
}
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}



@end
