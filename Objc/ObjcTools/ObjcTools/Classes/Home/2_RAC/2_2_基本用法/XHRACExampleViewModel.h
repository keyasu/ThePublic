//
//  XHRACExampleViewModel.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/19.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XHRACExampleViewModel : NSObject

+ (instancetype)shared;

/// 
@property (nonatomic, strong) RACCommand *cancelOrderCommand;

- (void)setupRACCommand;

@end

NS_ASSUME_NONNULL_END
