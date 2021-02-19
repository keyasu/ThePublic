//
//  XHPictureInPictureViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHPictureInPictureViewController.h"
#import <AVKit/AVKit.h>


@interface XHPictureInPictureViewController ()<AVPictureInPictureControllerDelegate>

@property (nonatomic, strong) UIButton *startBtn;

@property (nonatomic, strong) UIButton *endBtn;

@property (nonatomic, strong) AVPlayer * player;

@property (nonatomic, strong) UIView *playerView;

@property (nonatomic, strong) AVPictureInPictureController * picController;

@end

@implementation XHPictureInPictureViewController

/**
 * 需要在info.plaist 文件中增加
 *  Required background modes   -- 这是个数组 , 添加一个元素: App plays audio or streams audio/video using AirPlay
 *  这样就可以了
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setupUI
{    
    self.playerView = [UIView viewBgColor:UIColor.cyanColor];
    
    UIButton * btn1 = [[UIButton buttonWithTitle:@"开始" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self startClick];
    }];
    UIButton * btn2 = [[UIButton buttonWithTitle:@"结束" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self endClick];
    }];
    
    [self.view weg_addSubviews:
     btn1,
     btn2,
     self.playerView
     , nil];
    
    btn1.frame = CGRectMake(20, kNavigationBarHeight+20, kNewWidth(150), kNewHeight(100));
    btn2.frame = CGRectMake(20, btn1.bottom+20, kNewWidth(150), kNewHeight(100));
    self.playerView.frame = CGRectMake(0, kScreenH - kNewHeight(250*2), kScreenW, kNewHeight(211*2));
    
    {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
        
        // 获取图片
        UIImage * startImage = [AVPictureInPictureController pictureInPictureButtonStartImageCompatibleWithTraitCollection:nil];
        UIImage * endImage = [AVPictureInPictureController pictureInPictureButtonStopImageCompatibleWithTraitCollection:nil];
        
        // 设置图片
        [btn1 setImage:startImage forState:UIControlStateNormal];
        [btn2 setImage:endImage forState:UIControlStateNormal];
        
    }
    
}


- (void)setUpPlayer
{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"pincture_in_picture" ofType:@"MP4"];
    AVPlayerItem * item = [[AVPlayerItem alloc] initWithURL:[NSURL fileURLWithPath:path]];
    
    self.player = [AVPlayer playerWithPlayerItem:item];
    AVPlayerLayer * layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    layer.frame = self.playerView.bounds;
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    [self.playerView.layer addSublayer:layer];

    NSLog(@"---------------%@", NSStringFromCGRect(layer.bounds));

    self.picController = [[AVPictureInPictureController alloc] initWithPlayerLayer:layer];
    self.picController.delegate = self;
    [self.player play];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setUpPlayer];
}

- (void)startClick {
    if (self.picController.isPictureInPicturePossible) {
        [self.picController startPictureInPicture];
    }
    else
    {
        NSLog(@"picture is not possible");
    }
}
- (void)endClick {
    [self.picController stopPictureInPicture];
}


#pragma mark - delegate

- (void)pictureInPictureControllerWillStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    
}


- (void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    
}


- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController failedToStartPictureInPictureWithError:(NSError *)error
{
    NSLog(@"%@",error);
}


- (void)pictureInPictureControllerWillStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    
}
- (void)pictureInPictureControllerDidStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    
}
- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL restored))completionHandler
{
    
}





@end
