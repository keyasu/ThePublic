//
//  DefaultsKeys+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

import UIKit

extension UserDefaults {
    
    static func saveAt(value: Any, forKey key: String) {
        userDefaults.setValue(value, forKey: key)
        userDefaults.synchronize()
    }
    
    static func valueString(forKey key: String) -> String {
        return userDefaults.string(forKey: key) ?? ""
    }
    static func valueBool(forKey key: String) -> Bool {
        return userDefaults.bool(forKey: key)
    }
    
}

//MARK: - swift的 Userdefaults 的设置在这里这么的写着的吧
extension DefaultsKeys {
    
    static let isScan = DefaultsKey<Bool?>("isScan")
    static let username = DefaultsKey<String?>("username")
    static var count = DefaultsKey<Int?>("acoount")
    
    
}

