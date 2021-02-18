//
//  View+ViewChainable.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//


/// 给 view 增加协议
protocol ViewChainable {}
extension ViewChainable where Self: UIView {
    @discardableResult
    func config(_ config: (Self) -> Void) -> Self {
        config(self)
        return self
    }
}

///单独各个属性的添加
extension UIView : ViewChainable {
    /// 给view增加圆角
    func cornerRadius(_ cornerRadius: CGFloat = 0) -> Self {
        self.layer.cornerRadius = cornerRadius.HEIGHT()
        self.layer.masksToBounds = true
        return self
    }
    /// 给 view 增加边框
    func border(_ borderColor: UIColor = .hex_FFFFFF, borderWidth:CGFloat = 0.0) -> Self {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth.HEIGHT()
        return self
    }
    /// 背景颜色
    func bgColor(_ bgColor: UIColor = UIColor.clear) -> Self {
        self.backgroundColor = bgColor
        return self
    }
}

