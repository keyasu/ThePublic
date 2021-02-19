//
//  XHRACExampleViewModel.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHRACExampleViewModel.h"

@interface XHRACExampleViewModel ()

@end

@implementation XHRACExampleViewModel

+ (instancetype)shared {
    static XHRACExampleViewModel * viewModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        viewModel = [[XHRACExampleViewModel alloc] init];
    });
    return viewModel;
}



-(void)setupRACCommand
{
    @weakify(self);
//    self.cancelOrderCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//        @strongify(self);
//
//        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//        }];
//    }];
//    self.cancelOrderCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//        return [RACSignal createSignal:^RACDisposable *(id subscriber) {
//            @strongify(self);
//            self.cancelApi.setParams(input);
//            [[YXRequestClient sharedClient] loadDataWithApi:self.cancelApi successBlock:^(NSDictionary *result) {
//                [subscriber sendNext:result];
//                [subscriber sendCompleted];
//            } failureBlock:^(NSError *error) {
//                [subscriber sendError:error];
//            }];
//            return nil;
//            }];
//    }];
}


@end
