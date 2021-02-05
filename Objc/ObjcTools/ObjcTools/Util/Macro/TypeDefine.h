//
//  TypeDefine.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#ifndef TypeDefine_h
#define TypeDefine_h

#pragma mark - 上面是已经有的定义
typedef NS_ENUM(int, TVloadType)
{
    TVloadTypeNone          = 1,     //不刷新
    TVloadTypeRefresh       = 2,     //刷新
    TVloadTypeMore          = 3,     //加载更对多
    TVloadTypeAll           = 4,     //刷新和加载更多都有
};

typedef NS_ENUM(NSUInteger, WebViewLoadType) {
    /// 未知
    WebViewLoadTypeUnknown = 0,
    /// 未知
    WebViewLoadTypeUnknown1,
    /// 社会公寓
    WebViewLoadTypeGongYue,
    /// 隐私政策
    WebViewLoadTypeZhengce,
    
};



#endif /* TypeDefine_h */
