//
//  XHDeviceDataModel.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "BaseModel.h"
#import "XHDeviceDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XHDeviceDataModel : BaseModel

/// 文件名, 需要跳转的地方
@property (nonatomic, copy) NSString *tStr;
/// 描述-跳转时干嘛的
@property (nonatomic, copy) NSString *dStr;


@end

NS_ASSUME_NONNULL_END
