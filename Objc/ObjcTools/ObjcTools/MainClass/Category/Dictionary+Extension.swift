//
//  Dictionary+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

extension NSDictionary {
    
    func isSuccess() -> Bool {
        var issuc : Bool = false
        
        guard let resCode = self["code"] else {
            return issuc
        }
        if (resCode as! Int) == 200 {
            issuc = true
        }
        return issuc
    }
    func isBalanceLimit() ->Bool {
        var issuc : Bool = false
        guard let resCode = self["code"] else {
            return issuc
        }
        if (resCode as! Int) == 501 {
            issuc = true
        }
        PrintLog("账户余额不足, 请重试!")
        return issuc
        
    }
    
    //从字典中获取字符串的吧
    func stringForKey(_ key: String) -> String? {
        let result = self[key]
        if (result is NSNull) || result == nil {
            return ""
        } else if result is NSNumber {
            if let result = result {
                return "\(result)"
            }
            return nil
        } else {
            return result as? String
        }
    }

}
