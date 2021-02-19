//
//  XHRACTupleViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACTupleViewController.h"

@interface XHRACTupleViewController ()

@end

@implementation XHRACTupleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (void)setupUI {
    UIButton * btn1 = [[UIButton buttonWithTitle:@"元组" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self demo1];
    }];
    UIButton * btn2 = [[UIButton buttonWithTitle:@"遍历-数组" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self demo2];
    }];
    
    UIButton * btn3 = [[UIButton buttonWithTitle:@"遍历 - 字典" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self demo3];
    }];
    UIButton * btn4 = [[UIButton buttonWithTitle:@"数据转模型" FontSize:24 TitleColor:UIColor.orangeColor] touchUpInsideAction:^{
        [self demo4];
    }];
    
    [self.view weg_addSubviews:
     btn1,
     btn2,
     btn3,
     btn4
     , nil];
    
    btn1.frame = CGRectMake(20, kNavigationBarHeight+20, kNewWidth(150), kNewHeight(100));
    btn2.frame = CGRectMake(20, btn1.bottom+20, kNewWidth(150), kNewHeight(100));
    btn3.frame = CGRectMake(20, btn2.bottom+20, kNewWidth(150), kNewHeight(100));
    btn4.frame = CGRectMake(20, btn3.bottom+20, kNewWidth(150), kNewHeight(100));
    
    
}

- (void)demo1 {
    /* 元祖 */
    RACTuple *tuple = [RACTuple tupleWithObjects:@"firstObj",@"secondObj",@1, nil];
    NSString *string = tuple[1];
    NSLog(@"%@", string);
}

- (void)demo2 {
    NSArray *array = @[@"jack", @"Meegar", @"jams"];
    [array.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", [NSThread currentThread]);
        NSLog(@"%@", x);
    }];
}
- (void)demo3 {
    NSDictionary *dict = @{
                           @"name" : @"Meegar",
                           @"age" : @20,
                           };
    [dict.rac_sequence.signal subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"currentThread = %@", [NSThread currentThread]);
        NSLog(@"x = %@", x);
        NSLog(@"x.first = %@", x.first);
        NSLog(@"x.second = %@", x.second);
        
        RACTupleUnpack(NSString * key, NSString *value) = x;
        NSLog(@"key = %@, value = %@", key, value);
        
    }];
    
}

- (void)demo4 {
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"网页链接"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
        NSArray *infoArr = [[array.rac_sequence.signal map:^id _Nullable(NSDictionary *value) {
            return value; // 在这里可以进行数据转模型的变化
        }] toArray];
        NSLog(@"%@", infoArr);
    }] resume];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
