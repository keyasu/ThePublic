//
//  ToolsExtension.swift
//  LeetCode_Algorithm
//
//  Created by douhuo on 2021/4/27.
//

import UIKit
import Foundation

/// MARK: - 字符串转化成CGFloat Float double Int
protocol StringConverToNumber {
    
    /// MARK: - 转化CGFloat
    func toCGFloat() -> CGFloat
    /// MARK: - 转化Double
    func toDoule() -> Double
    /// MARK: - 转化Int
    func toInt() -> Int
    /// MARK: - 转化Float
    func toFloat() ->Float
}


/// MARK: - string extension

extension String:StringConverToNumber {
    
    func toCGFloat() -> CGFloat {
        guard let n = NumberFormatter().number(from: self) else {
            return 0
        }
        
        return CGFloat.init(n.floatValue)
    }
    
    func toDoule() -> Double {
        guard let n = NumberFormatter().number(from: self) else {
            return 0
        }
        
        return n.doubleValue
    }
    
    func toInt() -> Int {
        guard let n = NumberFormatter().number(from: self) else {
            return 0
        }
        
        return n.intValue
    }
    
    func toFloat() -> Float {
        guard let n = NumberFormatter().number(from: self) else {
            return 0
        }
        return n.floatValue
    }
}


//=====以下为处理width heght 计算问题而写的protocal 和 extension===
public protocol NumberConvertible {}

extension NumberConvertible {
    
    public func toString() -> String {
        return "\(self)"
    }
    
    public func WIDTH() -> CGFloat {
        guard let num = self as? NSNumber  else {
            return 0.0
        }
        let n = CGFloat(truncating: num)
        let sw = CGFloat((SRNW/375.0)) * n/2.0
        return sw
    }
    public func HEIGHT() -> CGFloat {
        guard let num = self as? NSNumber  else {
            return 0.0
        }
        let n = CGFloat(truncating: num)
        let sw = CGFloat((SRNW/375.0)) * n/2.0
        return sw
    }
    public func RealHEIGHT() -> CGFloat {
        
        guard let num = self as? NSNumber  else {
            return 0.0
        }
        let n = CGFloat(truncating: num)
        let sw = CGFloat((SRNH/667.0)) * n/2.0
        return sw
    }
    
}


extension Double:NumberConvertible {}
extension CGFloat:NumberConvertible {}
extension Int:NumberConvertible {}

