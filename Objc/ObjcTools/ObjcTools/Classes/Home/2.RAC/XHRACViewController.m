//
//  XHRACViewController.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACViewController.h"

@interface XHRACViewController ()

@end

@implementation XHRACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)demo1 {
    /* 元祖 */
    RACTuple *tuple = [RACTuple tupleWithObjects:@"firstObject",@"secondObject",@1, nil];
    NSString *string = tuple[1];
    NSLog(@"%@", string);
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
