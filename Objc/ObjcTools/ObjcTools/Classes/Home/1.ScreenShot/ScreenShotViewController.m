//
//  ScreenShotViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "ScreenShotViewController.h"

@interface ScreenShotViewController ()

/// 截图的
@property (nonatomic, strong) UIImageView *bgImgView;
/// <#desc#>
@property (nonatomic, strong) UIImageView *holderView;
/// <#desc#>
@property (nonatomic, strong) UIButton * btn1;
@property (nonatomic, strong) UIButton * btn2;
@property (nonatomic, strong) UIButton * btn3;
@property (nonatomic, strong) UIButton * btn4;

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
    [self.bgImgView setImageWith:@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fblog%2F202008%2F17%2F20200817121759_jetsw.thumb.400_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1616204279&t=7300fc69438196a7b0867c7eb93e3f02"];
    
    self.holderView = [UIImageView viewWithImageName:@""];
    self.holderView.backgroundColor = UIColor.hex_random;
    
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
    self.btn4 = [[UIButton buttonWithTitle:@"4. 清理占位图"
                                  FontSize:36 TitleColor:UIColor.hex_00184C] touchUpInsideAction:^{
        [self getImg4];
    }] ;
    
    [self.view weg_addSubviews:
     self.bgImgView,
     self.holderView,
     self.scrollView,
     self.btn1,
     self.btn2,
     self.btn3,
     self.btn4
     , nil];
    
    
}
- (void)setupNavigationUI {}
//MARK: 一句代码截图
- (void)getImg1 {
    //截屏
    UIView *view = [[UIApplication sharedApplication].keyWindow snapshotViewAfterScreenUpdates:YES];

    NSLog(@"%@", view);
    //保存
    UIImage * newImg = [self imageFromView:view];
    UIImageWriteToSavedPhotosAlbum(newImg, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    self.holderView.image = newImg;
}

- (UIImage *)getImageWithTableView
{
    UIImage* newImage = nil;
    CGFloat scale =  [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.scrollView.contentSize, self.scrollView.opaque, scale);
    {
        CGPoint savedContentOffset = self.scrollView.contentOffset;
        CGRect savedFrame = self.scrollView.frame;
        self.scrollView.contentOffset = CGPointZero;
        self.scrollView.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, self.scrollView.contentSize.height);
        [self.scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        self.scrollView.contentOffset = savedContentOffset;
        self.scrollView.frame = savedFrame;
        //将UIImage转换成CGImageRef
        CGImageRef sourceImageRef = [viewImage CGImage];
        //按照给定的矩形区域进行剪裁
        CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, CGRectMake(0, 0, self.scrollView.contentSize.width * scale, self.scrollView.contentSize.height * scale));
        //将CGImageRef转换成UIImage
        UIImage* scaledImage = [UIImage imageWithCGImage:newImageRef];
        //等比缩放
        CGSize size = CGSizeMake(scaledImage.size.width / scale, scaledImage.size.height / scale);
        UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
        [scaledImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
    }
 
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
//使用该方法不会模糊，根据屏幕密度计算
- (UIImage *)convertViewToImage:(UIView *)view {
    
    UIImage *imageRet = [[UIImage alloc]init];
    //UIGraphicsBeginImageContextWithOptions(区域大小, 是否是非透明的, 屏幕密度);
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageRet;
}
- (UIImage *)imageFromView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
    // [view.layer renderInContext:UIGraphicsGetCurrentContext()]; // <- same result...
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;
}
//MARK: 截屏
- (void)getImg2 {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height), NO, 0.0);
    
    /// 如果是指定view 替换 [UIApplication sharedApplication].keyWindow 就可以
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
   
    UIGraphicsEndImageContext();
    
    //保存
    if (screenShotImage != nil) {
        UIImageWriteToSavedPhotosAlbum(screenShotImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    self.holderView.image = screenShotImage;
}

//MARK: 第三种
- (void)getImg3
{
    CGPoint savedContentOffset = self.scrollView.contentOffset;
    CGRect savedFrame = self.scrollView.frame;
    
    self.scrollView.contentOffset = CGPointMake(0.001, 0.001);  ///加了点偏移,为了防止滚动视图底部没有被截取

    self.scrollView.frame = CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.contentSize.width, self.scrollView.contentSize.height);
  
    [self.scrollView setNeedsDisplay];
    
    //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    UIGraphicsBeginImageContextWithOptions(self.scrollView.contentSize, YES, [UIScreen mainScreen].scale);
    //renderInContext呈现接受者及其子范围到指定的上下文
    [self.scrollView.layer renderInContext:UIGraphicsGetCurrentContext()];
    //返回一个基于当前图形上下文的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    self.scrollView.contentOffset = savedContentOffset;
    self.scrollView.frame = savedFrame;
    
    UIGraphicsEndImageContext();
   
    if (image != nil) {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    
    self.holderView.image = image;
}

//MARK: 清理如图
- (void)getImg4 {
    self.holderView.image = [[UIImage alloc] init];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error == nil) {
        NSLog(@"保存成功");
        [self showMsg:@"保存成功"];
    }
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
        
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kNavigationBarHeight + kNewWidth(30));
        make.left.equalTo(self.view).offset(kNewWidth(30));
        make.width.mas_equalTo(kNewWidth(75*2));
        make.height.mas_equalTo(kNewWidth(134*2));
    }];
    [self.holderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kNavigationBarHeight + kNewWidth(30));
        make.left.equalTo(self.bgImgView.mas_right).offset(kNewWidth(30));
        make.width.mas_equalTo(kNewWidth(75*2));
        make.height.mas_equalTo(kNewWidth(134*2));
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(kNewWidth(50));
        make.width.mas_equalTo(kNewWidth(550));
        make.top.equalTo(self.bgImgView.mas_bottom).offset(kNewWidth(30));
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-kNewWidth(50));
    }];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-kNewWidth(50));
        make.top.equalTo(self.view).offset(kNavigationBarHeight + kNewHeight(50));
        make.width.mas_equalTo(kNewWidth(270));
        make.height.mas_equalTo(kNewWidth(75));
    }];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btn1.mas_right);
        make.top.equalTo(self.btn1.mas_bottom).offset(kNewHeight(50));
        make.width.mas_equalTo(kNewWidth(270));
        make.height.mas_equalTo(kNewWidth(75));
    }];
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btn1.mas_right);
        make.top.equalTo(self.btn2.mas_bottom).offset(kNewHeight(50));
        make.width.mas_equalTo(kNewWidth(270));
        make.height.mas_equalTo(kNewWidth(75));
    }];
    [self.btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.btn1.mas_right);
        make.top.equalTo(self.btn3.mas_bottom).offset(kNewHeight(50));
        make.width.mas_equalTo(kNewWidth(270));
        make.height.mas_equalTo(kNewWidth(75));
    }];
    
    
    
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = UIColor.hex_random;
        UILabel * l = [[UILabel alloc] init];
        l.backgroundColor = UIColor.hex_random;
        l.text = [self getText];
        l.numberOfLines = 0;
        l.frame = CGRectMake(kNewWidth(16), kNewWidth(16), kNewWidth(550-16-16), kNewHeight(3000));
        _scrollView.contentSize = CGSizeMake(kNewWidth(550), kNewHeight(3000+32));
        [_scrollView addSubview:l];
    }
    return _scrollView;
}



- (NSString *)getText {
    return
@"大年初一创下中国影史单日最高票房纪录，初一到初五连续五天单日票房破十亿元，贾玲导演处女作《你好，李焕英》成为最大黑马，《唐人街探案3》创下中国影史首日预售票房、首日票房、单日票房、最快破10亿等多项纪录……在疫情防控大形势下，今年春节电影市场却格外红火，不断创造奇迹。根据灯塔专业版实时数据，截至昨日22时，2021年春节档总票房累计超78亿元，总观影人次1.6亿，累计场次285.8万，创中国影史春节档累计票房、人次新纪录。档期内票房排名前三为《唐人街探案3》35.5亿元、《你好，李焕英》27.2亿元、《刺杀小说家》5.4亿元。\n\
    大盘超预期 票价涨幅明显 \n\
    \
苏宁影城慈云寺店店长乔建用“超出预期”来形容这个春节档。“2019年大年初一大盘票房是15亿元，今年则达到了17亿元，初三赶上情人节又有一个大冲刺。平均下来，每天的大盘都超过我们预期的两到三个亿，这个成绩确实不错。”在他看来，今年春节档给了整个电影行业和所有电影人信心，让大家坚持走下去，迎来恢复正常、向阳而生的状态。\n\
    \
高票房背后，许多观众发声吐槽今年票价贵、看不起。根据灯塔专业版数据，今年春节档（数据统计为初一至初五）全国平均票价为49.1元，比2019年春节档平均票价高出4.5元，增幅为10%。其中北上广深一线城市涨幅明显，较2019年春节档一线城市平均票价高出10.5元。\n\
    \
保利影城天安门店店长李旭坦言，今年春节档他所在的影院主要经历了三次涨价。“我们1月29日开始出售大年初一的票，刚开出30%的场次就看到卖得非常快，所以有了第一轮涨价，从50元左右涨到60元左右。临近春节时发现大家调整到七八十元，那就都调成七八十元。过了初一发现，即便涨到七八十元，售卖速度没有降，因此又涨了一二十块钱，这时观众的购票速度恢复到一个相对正常的水平。整个春节期间都维持在这个价格区间。”\n\
    \
对于票价上涨，影院经理普遍认为，这是市场规律，在春节档全民观影的热潮下，电影票变成紧俏商品，供不应求，价格就会上涨。“今年很多因素加在一起：一是提倡就地过年，北京人口也比往年春节要多很多；二是庙会等活动取消，看电影成为节日期间的主要娱乐活动；三是北京影院上座率受限50%，这么大的市场少了一半的座位，每开一个厅，票都瞬间卖光，第一排都得抢，根本没有选择的余地。”李旭认为，高票价没有抑制观众观影，对行业来说也是一个比较好的讯号，“说明大家对电影的热情还是很高涨的。”\
    \n\
“等初七上班后，票价就会降下去，北京影院的上座率也会恢复到跟全国一样的75%。”乔建说。\
    \n\
“李焕英”成黑马当之无愧\
    \n\
一位网友调侃，2021年春节档共有三部电影：《唐人街探案3》《你好，李焕英》以及其他电影。两部大热影片让同期上映的另外五部电影沦为陪衬，造就了赢家通吃的局面。\
    \n\
让人笑中带泪的《你好，李焕英》成为最具春节档气质的影片。电影评论学会会长饶曙光坦言，一开始他和其他观众一样，对演员贾玲转行当导演没抱太大希望，但看完影片确实有种喜出望外的感觉。“影片整体的构思和表达，尤其是其中蕴含的认识母亲、理解母亲、感恩母亲的情感，特别适合春节期间观影，成为黑马当之无愧。”\
    \n\
《唐人街探案3》的口碑则在巨大期待下岌岌可危。该片在春节档前三天异常火爆，不断刷新影史纪录，随后口碑却持续走低，豆瓣评分在春节档七部大片中垫底。但饶曙光认为，“《唐人街探案》系列电影对于中国系列电影的贡献，无论如何强调也不过分。中国电影市场发展特别需要这种系列电影、品牌电影来形成对市场的支撑，保证中国电影的稳定可持续发展。”\
    \n\
“春节档是一个全民放松娱乐的时期，今年的七部作品在类型化上都很突出，尤其《唐人街探案3》在商业化上做到了极致，这种创作模式值得中国电影人借鉴。”火麒麟影视总经理刘海玉说，“《唐人街探案》系列做到第三部，故事模式遵循套路，主线都是引入一个案件，再进行娱乐化包装，比如主演王宝强和刘昊然，一丑一帅，一个负责搞笑，一个负责破案。影片笑点也很商业化，比如变装秀、密闭空间里的尴尬相逢等，每一部都有。”他认为这种商业化思维对中国电影产业发展有正面意义，也树立起了“唐探”品牌。\
    \n\
春节档四五部大片足矣\
    \n\
对于存在感较弱的《新神榜：哪吒重生》《人潮汹涌》《侍神令》三部影片来说，也许片方现在最后悔的，便是当初选择春节档上映。三部影片口碑虽参差不齐，但质量都不算太差，阵容班底和制作水准也都还不错，如果放在其他档期，也许能让片方和观众皆大欢喜，但在春节档竞争激烈、影片多影厅少的情况下，没有超凡实力，就注定会成为炮灰。\
    \n\
李旭直言，各个电影公司在档期选择上会有自己的考量，比如《人潮汹涌》主演有刘德华，片方可能认为咖位够足，影片质量也够好，就要去春节档，但其实还是应该更合理地安排影片档期。“比如春节前大约一个半月的大盘很低迷，没什么重点影片可以撑起市场。如果有大片选择这一个半月上映，可以给市场注入新活力，没准儿效果更好。”在李旭看来，春节档从初一到初六，实际上只有六天（除夕没有新片上映），四五部影片就足矣，最多不要超过六部。影片数量太多，很多影院根本没有足够的影厅排片。\
    \n\
至于每年春节档各影片展开的营销大战，刘海玉认为，发行宣传只是锦上添花，作用没有想象的那么大，真正想要获得高票房，还是要电影本身质量过硬，得到观众认可。“刘德华为了《人潮汹涌》的宣传入驻快手，在平台上各种营销，粉丝几千万，但能否起作用，还是要看刘德华影响力和影片本身是不是密切相关。《人潮汹涌》相对沉稳严肃的调性不适合春节档，即使大家都很喜欢刘德华，但也不会说看了他的宣传短视频就会去买票看电影。”";
    
}

@end
