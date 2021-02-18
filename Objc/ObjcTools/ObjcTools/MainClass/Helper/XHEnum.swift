//
//  XHEnum.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//


// MARK: - scorollview 刷新类型
enum TVloadType {
    /** 没有加载效果 */
    case none
    /** 只有refresh效果 */
    case refresh
    /** 只有加载更多 */
    case more
    /** 刷新和加载更多都有 */
    case all
}


// MARK: - 网络加载类型
enum LoadWebType {
    /** 无法网页 */
    case unknown
    
    /** 用户协议 */
    case Service_agreement
    /** 用户隐私协议 */
    case pricaty_protoco
   
    
    
    
}

