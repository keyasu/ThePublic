//
//  View+Extension.swift
//  ObjcTools
//
//  Created by douhuo on 2021/2/18.
//  Copyright © 2021 wangergang. All rights reserved.
//

extension UIView {
    class func creatView(_ bgColor: UIColor,
                         radius: CGFloat = 0.0,
                         borderColor: UIColor = UIColor.clear,
                         borderWidth: CGFloat = 0.0) -> UIView
    {
        let v = UIView.init()
        v.backgroundColor = bgColor
        v.layer.cornerRadius = radius.WIDTH()
        v.layer.masksToBounds = true
        v.layer.borderColor = borderColor.cgColor
        v.layer.borderWidth = borderWidth.HEIGHT()
        
        return v
    }
    
    
}

extension UIView {
    // 将子数据添加到view上
    func JXD_addSubViews(_ elements: Any...) {
        if elements.count > 0 {
            for element in elements {
                self.addSubview(element as! UIView)
            }
        }
    }
    func bringToFront() {
        self.superview?.bringSubviewToFront(self)
    }
    func sendToBack() {
        self.superview?.sendSubviewToBack(self)
    }

}


extension UIView {
    
    ///新增加圆角
    func addRadius(radius: CGFloat) {
        layer.cornerRadius = radius.WIDTH()
        layer.masksToBounds = true
    }
    ///增加 border
    func addBoreder(borderColor: UIColor, borderWidth: CGFloat = 2.0) {
        layer.borderWidth = borderWidth.HEIGHT()
        layer.borderColor = borderColor.cgColor
    }
    
    
    
}
