//
//  BaseWebViewModel.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/5.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewModel : BaseModel

/// 建立模型的单例
+ (instancetype)shareModel ;

- (NSDictionary *)getDataWithLoadType:(WebViewLoadType)loadType ;


@end

NS_ASSUME_NONNULL_END
